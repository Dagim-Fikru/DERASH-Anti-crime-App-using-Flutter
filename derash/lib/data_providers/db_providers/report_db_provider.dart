import 'dart:convert';
import 'dart:io';
import 'package:derash/data_providers/report_provider.dart';
import 'package:derash/models/report.dart';
import 'package:derash/models/stats.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ReportDBProvider implements ReportProvider {
  static Database? _database;
  static final ReportDBProvider db = ReportDBProvider._();
  static final report = 'report';
  static final userId = 'userId';
  static final date = 'date';
  static final location = 'location';
  static final description = 'description';
  static final img = 'img';

  static final stats = 'stats';
  static final name = 'name';
  static final value = 'value';

  ReportDBProvider._();
  ReportDBProvider();
  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) {
      await _database?.execute('''CREATE TABLE IF NOT EXISTS $report(
              $userId TEXT PRIMARY KEY,
              $date TEXT UNIQUE NOT NULL,
              $location TEXT NOT NULL,
              $description TEXT NOT NULL,
          $img TEXT

              )
              ''');
      await _database?.execute('''CREATE TABLE IF NOT EXISTS $stats(
              $name TEXT PRIMARY KEY,
              $value INT  NOT NULL
              
              )
              ''');
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
      await _database?.execute('''CREATE TABLE IF NOT EXISTS $report(
              $userId TEXT PRIMARY KEY,
              $date TEXT UNIQUE NOT NULL,
              $location TEXT NOT NULL,
              $description TEXT NOT NULL,
          $img TEXT

              )
              ''');
      await _database?.execute('''CREATE TABLE IF NOT EXISTS $stats(
              $name TEXT PRIMARY KEY,
              $value INT  NOT NULL
              
              )
              ''');
    });
  }

  Future<List<Report>> insertReports(List<Report> reports, String token) async {
    try {
      final db = await database;
      for (final report in reports) {
        await db?.insert('report', report.toJson());
      }
      final allReports = getReports(token);
      return allReports;
    } catch (e) {
      throw Exception("inserting report field");
    }
  }

  Future<List<Stats>> insertStats(List<Stats> stats, String token) async {
    try {
      print("stat insertion");

      final db = await database;
      for (final stat in stats) {
        await db?.insert('stats', stat.toJson());
      }

      return getStatReport(token);
    } catch (e) {
      throw Exception("inserting stats field");
    }
  }

  @override
  Future<List<Report>> getReports(String token) async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM report");

      List<Report>? list =
          res!.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];

      return list;
    } catch (e) {
      throw Exception("getting reports field");
    }
  }

  @override
  Future<List<Stats>> getStatReport(String token) async {
    try {
      print("get stat");
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM stats");

      List<Stats> stats = res?.map((c) => Stats.fromJson(c)) as List<Stats>;

      return stats;
    } catch (e) {
      throw Exception("getting stats report field");
    }
  }

  @override
  Future<List<Report>> getUserReport(String id, String token) async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM report WHERE id = $id");

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
