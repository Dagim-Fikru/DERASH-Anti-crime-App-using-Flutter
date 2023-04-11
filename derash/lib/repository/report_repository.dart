import 'package:derash/models/report.dart';
import 'package:derash/models/stats.dart';

import '../data_providers/api_providers/report_api_provider.dart';
import '../data_providers/db_providers/report_db_provider.dart';

class ReportRepository {
  final ReportApiDataProvider reportApiDataProvider = ReportApiDataProvider();
  final ReportDBProvider dbReportProvider = ReportDBProvider() ;
  // final StatsReport dbStatsProvider;

ReportRepository();
//send report
  Future<Report> sendReport(Report report, String token) async {
    // dbReportProvider.createReport(report);
    return await reportApiDataProvider.sendReport(report , token);
  }

//user get history
  Future<List<Report>> getUserReport(String id, String token) async {
    final report = await dbReportProvider.getUserReport(id , token);
    if (report.isNotEmpty) {
      return report;
    }
    final userreportsFromApi =
        reportApiDataProvider.getUserReport(id , token) as List<Report>;
    dbReportProvider.insertReports(userreportsFromApi , token);
    return userreportsFromApi;
  }

  Future<List<Report>> getAllReports(String token) async {
    final reports = await dbReportProvider.getReports(token);
    if (reports.isNotEmpty) {
      return reports;
    }
    final reportsFromApi = reportApiDataProvider.getReports as List<Report>;
    dbReportProvider.insertReports(reportsFromApi , token);
    return reportsFromApi;
  }

  Future<List<Stats>> getStats(String token) async {
    // if (reportApiDataProvider.getStatReport(token) != Null) {
    // return reportApiDataProvider.getStatReport(token);
    // }
    final reportStats = await dbReportProvider.getStatReport(token);

    if (reportStats.isNotEmpty) {
      return reportStats;
    }
    final reportStatsFromApi = await reportApiDataProvider.getStatReport(token);
    await dbReportProvider.insertStats(reportStatsFromApi , token);
      // for user in UserApiDataProvider.getAllUser(token){
    //   Stats reportsFromApi =
    //       reportApiDataProvider.getStatReport(token) as Stats;
    //   dbStatsProvider.createStats(reportsFromApi);
    //   return reportsFromApi;
    // }
    return reportStatsFromApi;
  }
}
