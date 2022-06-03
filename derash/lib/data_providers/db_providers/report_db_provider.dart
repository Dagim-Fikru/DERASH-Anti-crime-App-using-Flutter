import 'dart:convert';
import 'dart:io';
import 'package:derash/data_providers/report_provider.dart';
import 'package:derash/models/report_model.dart';
import 'package:derash/models/stats.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ReportDBProvider implements ReportProvider {
  static Database? _database;
  static final ReportDBProvider db = ReportDBProvider._();

  ReportDBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) {
      await _database?.execute('CREATE TABLE Report('
          'userId TEXT PRIMARY KEY,'
          'date DATETIME NOT NULL,'
          'location TEXT NOT NULL,'
          'description TEXT NOT NULL,'
          'description TEXT NOT NULL,'
          'img TEXT'
          ')');
      await _database?.execute('CREATE TABLE Stats('
          'name TEXT PRIMARY KEY,'
          'value INT NOT NULL,'
          ')');
      return _database;
    }

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'derash-android.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Report('
          'userId TEXT PRIMARY KEY,'
          'date DATETIME NOT NULL,'
          'location TEXT NOT NULL,'
          'description TEXT NOT NULL,'
          'image TEXT,'
          ')');
      await _database?.execute('CREATE TABLE Stats('
          'name TEXT PRIMARY KEY,'
          'value INT NOT NULL,'
          ')');
    });
  }

  Future<List<Report>> insertReports(List<Report> reports) async {
    try {
      final db = await database;
      for (final report in reports) {
        await db?.insert('Report', report.toJson());
      }
      final allReports = getReports();
      return allReports;
    } catch (e) {
      throw Exception("inserting report field");
    }
  }

  Future<List<Stats>> insertStats(List<Stats> stats) async {
    try {
      final db = await database;
      for (final stat in stats) {
        final res = await db?.insert('Report', stat.toJson());
      }

      return getStatReport();
    } catch (e) {
      throw Exception("inserting report field");
    }
  }

  @override
  Future<List<Report>> getReports() async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM Report");

      List<Report>? list =
          res!.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];

      return list;
    } catch (e) {
      throw Exception("getting reports field");
    }
  }

  @override
  Future<List<Stats>> getStatReport() async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM Stats");

      List<Stats> stats = res?.map((c) => Stats.fromJson(c)) as List<Stats>;

      return stats;
    } catch (e) {
      throw Exception("getting stats report field");
    }
  }

  @override
  Future<List<Report>> getUserReport(String id) async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM Report WHERE id = $id");

      List<Report> list =
          res!.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];

      return list;
    } catch (e) {
      throw Exception("getting user report field");
    }
  }

  // @override
  // Future<Report> sendReport(
  //   Report report,
  // ) {
  //   // TODO: implement sendReport
  //   throw UnimplementedError();
  // }
}
