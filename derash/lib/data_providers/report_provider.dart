import 'package:derash/models/report.dart';
import 'package:derash/models/stats.dart';

abstract class ReportProvider {
  // Future<Report> sendReport(Report report );
  Future<List<Report>> getUserReport(String id ,String token);
  Future<List<Report>> getReports(String token);
  Future<List<Stats>> getStatReport(String token);
}