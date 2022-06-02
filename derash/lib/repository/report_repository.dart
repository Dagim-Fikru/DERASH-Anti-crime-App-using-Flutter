import 'package:derash/models/report_model.dart';
import 'package:derash/models/stats.dart';

import '../data_providers/api_providers/report_api_provider.dart';
import '../data_providers/db_providers/report_db_provider.dart';
import '../data_providers/db_providers/report_db_stats.dart';

class ReportRepository {
  final ReportApiDataProvider reportApiDataProvider;
  final ReportDBProvider dbReportProvider;
  final StatsReport dbStatsProvider;
  ReportRepository(this.reportApiDataProvider, this.dbReportProvider, this.dbStatsProvider);
//send report
  Future<Report> sendReport(Report report, String token) async {
     dbReportProvider.createReport(report);
    return reportApiDataProvider.sendReport(report, token);
  }

//user get history
  Future<Future<Object?>> getUserReport(Report report, String token) async {
    // if (dbReportProvider.getReport(report) == null ) {
      
    //   return reportApiDataProvider.getUserReport(token);
    // }
    // if (reportApiDataProvider.getUserReport(token) != Null) {
    // }
    return dbReportProvider.getReport(report);
  }

  Future<Future<Object?>> getUserReports(String token ) async {
    // if (reportApiDataProvider.getReports(token) != Null) {
    //   return reportApiDataProvider.getReports(token);
    // }
    if (dbReportProvider.getAllReports() == null ) {
        Report reportsFromApi = reportApiDataProvider.getReports(token) as Report;
      dbReportProvider.createReport(reportsFromApi);
      // return  reportsFromApi;
      }
      return dbReportProvider.getAllReports() ;
    // return dbReportProvider.getAllReports();
  }

  Future<Object> getStats(String token) async {
    // if (reportApiDataProvider.getStatReport(token) != Null) {
      // return reportApiDataProvider.getStatReport(token);
    // }
    if (dbStatsProvider.getStats() == null ) {
      // for user in UserApiDataProvider.getAllUser(token){
        Stats reportsFromApi = reportApiDataProvider.getStatReport(token) as Stats;
      dbStatsProvider.createStats(reportsFromApi);
      return reportsFromApi;
      }
      return dbStatsProvider.getStats() ;
  }
}
