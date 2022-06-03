import 'package:derash/models/report.dart';

class User {
  int? id;
  String username;
  String email;
  String? password;
  String role;
  List<Report>? reports;

  User(
      {required this.username,
      required this.email,
      this.id,
      this.password,
      this.role = 'User'});
}
