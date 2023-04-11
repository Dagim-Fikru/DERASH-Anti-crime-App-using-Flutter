import 'dart:convert';

import 'package:derash/data_providers/user_provider.dart';
import 'package:http/http.dart' as http;

import 'package:derash/models/user.dart';

class UserApiDataProvider implements UserProvider {
  static const String _baseUrl = "http://10.0.2.2:5000/api/user/";

  
  @override
  Future<String> deleteUser(String id ,String token) async {
    final response = await http
        .delete(Uri.parse("$_baseUrl/$id"), headers: {"token": token});

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("deleteing User  failed");
    }
  }

  @override
  Future<List<User>> getAllUser( String token) async {
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
      List<User> users;
      users = (jsonDecode(response.body) as List)
          .map((e) => User.fromJson(e))
          .toList();
      return users;
    } else {
      throw Exception("Fetching User  failed");
    }
  }

  
  @override
  Future<List<User>> updateUser(String id, User user,  String token)async {
  final response = await http.put(Uri.parse("$_baseUrl/$id"),
      headers: {"token": token},
      body: jsonEncode({
        "id": id,
        "username": user.username,
        "email": user.email,
        "password": user.password
      }));

  if (response.statusCode == 200) {
   List<User> users;
      users = (jsonDecode(response.body) as List)
          .map((e) => User.fromJson(e))
          .toList();
    return users;
  } else {
    throw Exception("Could not update user");
  }
  }
}




