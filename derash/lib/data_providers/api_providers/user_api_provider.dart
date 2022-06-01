import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:derash/models/user_model.dart';

class UserApiDataProvider {
  static const String _baseUrl = "http://localhost:5000/api/user/";

  // get users
  Future<User> getAllUser(String token) async {
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching User  failed");
    }
  }

//delete user
  Future<User> deleteUser(String id, String token) async {
    final response = await http
        .delete(Uri.parse("$_baseUrl/$id"), headers: {"token": token});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("deleteing User  failed");
    }
  }

// update user data
  Future<User> update(String id, String token, User user) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {"token": token},
        body: jsonEncode({
          "id": id,
          "username": user.username,
          "email": user.email,
          "password": user.password
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update user");
    }
  }


}
