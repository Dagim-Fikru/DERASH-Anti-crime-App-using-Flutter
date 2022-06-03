import 'dart:io';
import 'package:derash/models/user_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../user_provider.dart';

class UserDBProvider implements UserProvider {
  static Database? _database;
  static final UserDBProvider db = UserDBProvider._();

  UserDBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

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
      await db.execute('CREATE TABLE User('
          'id TEXT PRIMARY KEY,'
          'username TEXT NOT NULL,'
          'email TEXT NOT NULL UNIQUE,'
          'password TEXT NOT NULL ,'
          'token TEXT ,'
          ')');
    });
  }

  Future<void> insertAll(List<User> users) async {
    try {
      final db = await database;
      // final batch = db?.batch();
      for (final user in users) {
        final res = await db?.insert('Report', user.toJson());
        
      }
      // return res;
    } catch (e) {
      throw Exception("deleting user field");
    }
  }

  @override
  Future<String> deleteUser(String id) async {
    try {
      final db = await database;
      await db?.delete("User", where: 'id = ?', whereArgs: [id]);
      const message = 'user deleted seccesful';
      return message;
    } catch (e) {
      throw Exception("deleting user field");
    }
  }

  @override
  Future<List<User>> getAllUser() async {
    try {
      final db = await database;
      final res = await db?.rawQuery("SELECT * FROM User ");

      List<User> list =
          res!.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
      return list;
    } catch (e) {
      throw Exception("getting users field");
    }
  }

  @override
  Future<List<User>> updateUser(String id, User user) async {
    try {
      final db = await database;
      await db?.rawUpdate(
          "UPDATE User SET username =  ${user.username} , email = ${user.email} , password = ${user.password} ,token = ${user.token}WHERE id = ${user.id}");
      final users = getAllUser();
      return users;
    } catch (e) {
      throw Exception("updating user Field");
    }
  }
}
