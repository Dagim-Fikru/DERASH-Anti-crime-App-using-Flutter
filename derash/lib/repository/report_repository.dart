import 'package:derash/models/report_model.dart';

import '../data_providers/api_providers/report_api_provider.dart';
import '../data_providers/db_providers/report_db_provider.dart';

class ReportRepository {
  final ReportApiDataProvider reportApiDataProvider;
  final ReportDBProvider dbProvider;
  ReportRepository(this.reportApiDataProvider, this.dbProvider);
//send report
  Future<Report> sendReport(Report report, String token) async {
    dbProvider.createReport(report);
    return reportApiDataProvider.sendReport(report, token);
  }

//user get history
  Future<Future<Object?>> getUserReport(Report report, String token) async {
    if (reportApiDataProvider.getUserReport(token) != Null) {
      return reportApiDataProvider.getUserReport(token);
    }
    return dbProvider.getReport(report);
  }

  Future<Future<Object?>> getUserReports(String token) async {
    if (reportApiDataProvider.getReports(token) != Null) {
      return reportApiDataProvider.getReports(token);
    }
    return dbProvider.getAllReports();
  }

  Future<Future<Object?>> getStats(String token) async {
    if (reportApiDataProvider.getStatReport(token) != Null) {
      return reportApiDataProvider.getStatReport(token);
    }
    return dbProvider.getStats();
  }
}
