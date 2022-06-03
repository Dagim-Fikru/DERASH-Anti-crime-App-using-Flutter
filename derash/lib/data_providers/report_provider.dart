import 'package:derash/models/report_model.dart';
import 'package:derash/models/stats.dart';

abstract class ReportProvider {
  // Future<Report> sendReport(Report report );
  Future<List<Report>> getUserReport(String id );
  Future<List<Report>> getReports();
  Future<List<Stats>> getStatReport();
}