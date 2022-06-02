import 'dart:io';
import 'package:derash/models/report_model.dart';
import 'package:derash/models/stats.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StatsReport {
  static Database? _database;
  static final StatsReport db = StatsReport._();

  StatsReport._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) {
      await _database?.execute('CREATE TABLE Stats('
          'name TEXT NOT NULL,'
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
      await db.execute('CREATE TABLE Stats('
          'name TEXT NOT NULL,'
          'value INT NOT NULL,'
          ')');
    });
  }
  //insert into stats table
createStats(Stats stats) async {
    final db = await database;
    final res = await db?.insert('Report', stats.toJson());

    return res;
  }

  // get report stats
  Future<List<Map<String, Object?>>?> getStats() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Stats");

    return res;
  }
}
