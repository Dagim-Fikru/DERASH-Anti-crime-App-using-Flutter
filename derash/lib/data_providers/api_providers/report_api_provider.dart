import 'dart:convert';

// import 'package:derash/models/station.dart';
import 'package:derash/data_providers/report_provider.dart';
import 'package:derash/models/report.dart';
import 'package:http/http.dart' as http;
import '../db_providers/report_db_provider.dart';
import 'package:derash/models/stats.dart';

// import 'package:derash/models/user.dart';

class ReportApiDataProvider implements ReportProvider {
  static const String _baseUrl = "http://10.0.2.2:5000/api/station/";

  @override
  Future<List<Report>> getReports(String token)async {
    final response =
        await http.get(Uri.parse(_baseUrl), headers: {"token": token});

    if (response.statusCode == 200) {
       List<Report> reports;
      reports = (jsonDecode(response.body) as List)
          .map((e) => Report.fromJson(e))
          .toList();
      return reports;
    } else {
      throw Exception("  failed to get report");
    }
  }

  @override
  Future<List<Stats>> getStatReport(String token) async{
    final response =
        await http.get(Uri.parse("$_baseUrl/stats"), headers: {"token": token});

    if (response.statusCode == 200) {
      List<Stats> stats;
      stats = (jsonDecode(response.body) as List)
          .map((e) => Stats.fromJson(e))
          .toList();
      return  stats;
    }
    else {
      throw Exception("  failed to get report");
    }
  }
  
  @override
  Future<List<Report>> getUserReport(String id,String token)async {
     final response = await http
        .get(Uri.parse("$_baseUrl/savedreport"), headers: {"token": token});

    if (response.statusCode == 200) {
      // dbProvider.createReport(Report.fromJson(jsonDecode(response.body)));

      List<Report> reports;
      reports = (jsonDecode(response.body) as List)
          .map((e) => Report.fromJson(e))
          .toList();
      return reports;
    } else {
      throw Exception("Fetching user report  failed");
    }
  }
  
  
  Future<Report> sendReport(Report report,String token) async {
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
  }



