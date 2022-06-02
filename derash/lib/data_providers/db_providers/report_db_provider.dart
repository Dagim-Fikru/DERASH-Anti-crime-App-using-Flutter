import 'dart:io';
import 'package:derash/models/report_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ReportDBProvider {
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
    });
  }

  // Insert report on database
  createReport(Report newReport) async {
    final db = await database;
    final res = await db?.insert('Report', newReport.toJson());

    return res;
  }



//get user report
  Future<List<Map<String, Object?>>?> getReport(Report report) async {
    final db = await database;
    final res =
        await db?.rawQuery("SELECT * FROM Report WHERE id = ${report.userId}");

    // List<Object> list =
    //     res!.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];

    return res;
  }

//get all report
  Future<List<Report>> getAllReports() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Report");

    List<Report>? list =
        res!.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];

    return list;
  }

  // get report stats
  // Future<Map> getStats() async {
  //   final db = await database;
  //   final res = await db?.rawQuery("SELECT * FROM Report");
  //   var locations = [];
  //   var map = Map();
  //   for (int i = 0; i < res!.length; i++) {
  //     locations.add(res[i]);
  //     // interate througn the object in the i th index and get location
  //   }

  //   for (var element in locations) {
  //     if (!map.containsKey(element)) {
  //       map[element] = 1;
  //     } else {
  //       map[element] += 1;
  //     }
  //   }

  //   return map;
  // }
}
