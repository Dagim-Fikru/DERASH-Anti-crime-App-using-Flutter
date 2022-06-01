// ignore_for_file: file_names

import 'dart:io';

class Report {
  String location;
  DateTime date;
  String incident;
  File? image;

  Report({required this.location, required this.date, required this.incident});
}
