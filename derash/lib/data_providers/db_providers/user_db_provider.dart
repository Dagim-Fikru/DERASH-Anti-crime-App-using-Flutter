import 'dart:io';
import 'package:derash/models/user_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class UserDBProvider {
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

  // Insert user on database
  createUser(User newUser) async {
    final db = await database;
    final res = await db?.insert('User', newUser.toJson());

    return res;
  }  
  //get user
  getUser(User user) async {
    final db = await database;
    final res =
        await db?.rawQuery("SELECT * FROM User WHERE id = ${user.id}");

    // List<Object> list =
        // res!.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
    return res;
  }
  // Delete  user
  deleteUser(User user) async {
    final db = await database;
    final res = await db?.delete("User", where: 'id = ?', whereArgs: [user.id]);

    return res;
  }
  // logoutUser(User user) async {
  //    final db = await database;
  //   final res = await db?.rawUpdate(
  //       "UPDATE User SET ,token = ${null} WHERE id = ${user.id}");

  //   return res;
  // }
  //user update
  updateUser(User user) async {
    final db = await database;
    final res = await db?.rawUpdate(
        "UPDATE User SET username =  ${user.username} , email = ${user.email} , password = ${user.password} ,token = ${user.token}WHERE id = ${user.id}");

    return res;
  }

//get all users
  getAllUsers() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM User");

    // List<User>? list =
        // res!.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];

    return res;
  }
  Future close() async {
    final db = await database;
    db?.close();
  }
}
