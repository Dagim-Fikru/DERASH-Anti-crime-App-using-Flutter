import 'dart:io';
import 'package:derash/models/station_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StationDBProvider {
  static Database? _database;
  static final StationDBProvider db = StationDBProvider._();

  StationDBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) {
      await _database?.execute('CREATE TABLE Station('
          'id TEXT PRIMARY KEY,'
          'stationame TEXT ,'
          'stationemail TEXT UNIQUE NOT NULL,'
          'stationlocation TEXT NOT NULL,'
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
      await db.execute('CREATE TABLE Station('
          'id TEXT PRIMARY KEY,'
          'stationame TEXT ,'
          'stationemail TEXT UNIQUE NOT NULL,'
          'stationlocation TEXT NOT NULL,'
          ')');
    });
  }

  // Insert station on database
  createStation(Station newStaion) async {
    final db = await database;
    final res = await db?.insert('Station', newStaion.toJson());

    return res;
  }

//get stations
  Future<List<Object>> getStation(Station station) async {
    final db = await database;
    final res =
        await db?.rawQuery("SELECT * FROM Station ");

    List<Object> list =
        res!.isNotEmpty ? res.map((c) => Station.fromJson(c)).toList() : [];

    return list;
  }

//update station
    Future<int?> updateStation(Station station) async {
    final db = await database;
    final res = await db?.rawUpdate(
        "UPDATE Customer SET stationame =  ${station.stationame} , stationemail = ${station.stationemail} , stationlocation = ${station.stationlocation} WHERE id = ${station.id}");

    return res;
  }

// delete station
    Future<int?> deleteStation(Station station) async {
    final db = await database;
    final res = await db?.delete("Station", where: 'id = ?', whereArgs: [station.id]);

    return res;
  }
}
