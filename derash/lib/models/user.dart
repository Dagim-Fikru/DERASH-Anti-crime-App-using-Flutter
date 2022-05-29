import 'package:derash/models/report.dart';

class User {
  String id;
  String username;
  String email;
  String? password;
  List<Report>? reports;

  User({required this.username, required this.email, required this.id});
}
