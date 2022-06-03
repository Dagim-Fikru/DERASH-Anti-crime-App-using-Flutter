import 'package:derash/models/report.dart';

class User {
  int? id;
  String username;
  String email;
  String? password;
  String role;
  List<Report>? reports;
  String? token;

  User(
      {required this.username,
      required this.email,
      this.id,
      this.password,
      this.role = 'User'});

  bool get isAdmin => role == 'Admin';
}
