import 'dart:convert';

// import 'package:derash/models/station.dart';
import 'package:derash/models/report_model.dart';
import 'package:http/http.dart' as http;
import '../db_providers/report_db_provider.dart';


// import 'package:derash/models/user.dart';

class ReportApiDataProvider {
  static const String _baseUrl = "http://localhost:5000/api/station/";
  final ReportDBProvider dbProvider;

  ReportApiDataProvider(this.dbProvider);

// send report
  Future<Report> sendReport(Report report, String token) async {
    final http.Response response =
        await http.post(Uri.parse("$_baseUrl/sendreport"),
            headers: {"token": token},
            body: jsonEncode({
              "date": report.date,
              "location": report.location,
              "description": report.description,
              'img': report.img
            }));

    if (response.statusCode == 201) {
      return Report.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to send report");
    }
  }

  // user saved report
  Future<Report> getUserReport(String token) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/savedreport"), headers: {"token": token});

    if (response.statusCode == 200) {
      // dbProvider.createReport(Report.fromJson(jsonDecode(response.body)));

      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Fetching user report  failed");
    }
  }

//get all reports
  Future<Report> getReports(String token) async {
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("  failed to get report");
    }
  }

//get stat report
  Future<Report> getStatReport(String token) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/stats"), headers: {"token": token});

    if (response.statusCode == 200) {
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("  failed to get report");
    }
  }
}
