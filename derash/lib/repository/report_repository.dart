import 'package:derash/models/report.dart';
import 'package:derash/models/stats.dart';

import '../data_providers/api_providers/report_api_provider.dart';
import '../data_providers/db_providers/report_db_provider.dart';
import '../data_providers/db_providers/report_db_stats.dart';

class ReportRepository {
  final ReportApiDataProvider reportApiDataProvider;
  final ReportDBProvider dbReportProvider;
  // final StatsReport dbStatsProvider;
  ReportRepository(this.reportApiDataProvider, this.dbReportProvider);

//send report
  Future<Report> sendReport(Report report, String token) async {
    // dbReportProvider.createReport(report);
    return await reportApiDataProvider.sendReport(report);
  }

//user get history
  Future<List<Report>> getUserReport(String id, String token) async {
    final report = await dbReportProvider.getUserReport(id);
    if (report.isNotEmpty) {
      return report;
    }
    final userreportsFromApi =
        reportApiDataProvider.getUserReport(id) as List<Report>;
    dbReportProvider.insertReports(userreportsFromApi);
    return userreportsFromApi;
  }

  Future<List<Report>> getAllReports(String token) async {
    final reports = await dbReportProvider.getReports();
    if (reports.isNotEmpty) {
      return reports;
    }
    final reportsFromApi = reportApiDataProvider.getReports as List<Report>;
    dbReportProvider.insertReports(reportsFromApi);
    return reportsFromApi;
  }

  Future<List<Stats>> getStats(String token) async {
    // if (reportApiDataProvider.getStatReport(token) != Null) {
    // return reportApiDataProvider.getStatReport(token);
    // }
    final reportStats = await dbReportProvider.getStatReport();

    if (reportStats.isNotEmpty) {
      return reportStats;
    }
    final reportStatsFromApi = await reportApiDataProvider.getStatReport();
    await dbReportProvider.insertStats(reportStatsFromApi);
      // for user in UserApiDataProvider.getAllUser(token){
    //   Stats reportsFromApi =
    //       reportApiDataProvider.getStatReport(token) as Stats;
    //   dbStatsProvider.createStats(reportsFromApi);
    //   return reportsFromApi;
    // }
    return reportStatsFromApi;
  }
}
