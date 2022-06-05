import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:derash/models/user.dart';

class UserAuthApiDataProvider {
  static const String _baseUrl = "http://10.0.2.2:5000/api/auth/";
//register
  Future<User> signUpUser(User user) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/register"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "username": user.username,
              "email": user.email,
              "password": user.password,
            }));

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create user");
    }
  }

//login
  Future<User> signInUser(String email, String password) async {
    print("user is about to loggin");
    print("email" + email);
    print("password" + password);
    // try {
    final http.Response response = await http.post(Uri.parse("$_baseUrl/login"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }));

    print("after reposnse");
    print("response" + response.body);

    if (response.statusCode == 200) {
      // print(User.fromJson(jsonDecode(response.body)));
      print("okkkkk");
      print(response.body);
      print(jsonDecode(response.body));
      return User.fromJson(jsonDecode(response.body));
    }
    // {
    throw Exception("Failed to login user");
    // }

    // } catch (e) {
    //   print("eroor "+ e.toString());

    // }
    //        throw Exception("Failed to login user");
  }

  // login out
  Future<User> signOutUser(String token) async {
    final response = await http
        .put(Uri.parse("$_baseUrl/logout"), headers: {"token": token});

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("field to logout");
    }
  }
}
