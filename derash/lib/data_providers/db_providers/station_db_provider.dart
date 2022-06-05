import 'dart:io';
import 'package:derash/data_providers/station_provider.dart';
import 'package:derash/models/station.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class StationDBProvider implements StationProvider {
  static Database? _database;
  static final StationDBProvider db = StationDBProvider._();

  static final station = 'station';
  static final id = 'id';
  static final stationemail = 'stationemail';
  static final stationlocation = 'stationlocation';
  StationDBProvider._();
  StationDBProvider();

  Future<Database?>  get database async {
    // If database exists, return database
    if (_database != null) {
      print("database does exsit");
      await _database?.execute('''CREATE TABLE IF NOT EXISTS $station(
              $id TEXT PRIMARY KEY,
              $stationemail TEXT UNIQUE NOT NULL,
              $stationlocation TEXT NOT NULL
              )
              ''');
      return _database;
    }

    // If database don't exists, create one

    _database = await initDB();


    return _database;
  }

  // Create the database and the Employee table
  Future<Database?> initDB() async {
  
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String appDocPath = appDocDir.path;
       
        final path = join(appDocPath, 'derash-android.db');

        return openDatabase(path, version: 1, onCreate: (db, version) async {
          await db.execute('''CREATE TABLE IF NOT EXISTS $station(
              $id TEXT PRIMARY KEY,
              $stationemail TEXT UNIQUE NOT NULL,
              $stationlocation TEXT NOT NULL
              )
              ''');
        });
      }
   
    // return null;
  

  Future<void> addStations(
      List<Station> stations, String token) async {
    try {
      final db = await database;
      for (final station in stations) {
        final res = await db?.insert('station', station.toJson());
      }
    } catch (e) {
      throw Exception("adding station field");
    }
  }

  @override
  Future<List<Station>> addStation(Station stations, String token) {
    final allstations = getAllStations(token);
    return allstations;
  }

  @override
  Future<String> deleteStation(String id, String token) async {
    try {
      final db = await database;
      await db?.delete("station", where: 'id = ?', whereArgs: [id]);
      const message = 'Station deleted succefful';
      return message;
    } catch (e) {
      throw Exception("deleting station field");
    }
  }

  @override
  Future<List<Station>> getAllStations(String token) async {

    try {
     
      final db = await database;
      
      final res = await db?.rawQuery("SELECT * FROM station ");

      List<Station> list =
          res!.isNotEmpty ? res.map((c) => Station.fromJson(c)).toList() : [];
      return list;
    } catch (e) {
      throw Exception("getting all station field");
    }
  }

  @override
  Future<List<Station>> updateStation(
      String id, Station station, String token) async {
    try {
      final db = await database;
      final res = await db?.rawUpdate(
          "UPDATE station SET  stationemail = ${station.stationemail} , stationlocation = ${station.stationlocation} WHERE id = ${id}");
      final stations = getAllStations(token);
      return stations;
    } catch (e) {
      throw Exception("updating all station field");
    }
  }
}
