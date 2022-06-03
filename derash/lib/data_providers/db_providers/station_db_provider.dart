import 'dart:io';
import 'package:derash/data_providers/station_provider.dart';
import 'package:derash/models/station.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StationDBProvider implements StationProvider {
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

  Future<List<Station>> addStations(List<Station> stations) async {
    try {
      final db = await database;
      for (final station in stations) {
        final res = await db?.insert('Station', station.toJson());
      }
      return getAllStations();
    } catch (e) {
      throw Exception("adding station field");
    }
  }

  @override
  Future<List<Station>> addStation(Station stations) {
 
    final allstations = getAllStations();
    return allstations;
  }

  @override
  Future<String> deleteStation(String id) async {
    try {
      final db = await database;
      await db?.delete("Station", where: 'id = ?', whereArgs: [id]);
      const message = 'Station deleted succefful';
      return message;
    } catch (e) {
      throw Exception("deleting station field");
    }
  }

  @override
  Future<List<Station>> getAllStations() async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM Station ");

      List<Station> list =
          res!.isNotEmpty ? res.map((c) => Station.fromJson(c)).toList() : [];
      return list;
    } catch (e) {
      throw Exception("getting all station field");
    }
  }

  @override
  Future<List<Station>> updateStation(String id, Station station) async {
    try {
      final db = await database;
      final res = await db?.rawUpdate(
          "UPDATE Customer SET stationame =  ${station.stationame} , stationemail = ${station.stationemail} , stationlocation = ${station.stationlocation} WHERE id = ${id}");
      final stations = getAllStations();
      return stations;
    } catch (e) {
      throw Exception("updating all station field");
    }
  }
}
