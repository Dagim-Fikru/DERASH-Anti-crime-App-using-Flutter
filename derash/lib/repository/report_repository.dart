class ReportRepository {
  Map<String, int> stat = {'gerji': 1, 'bole': 7, '5kilo': 18, '4kilo': 43};
  Future<Map<String, int>> getStat() async {
    return Future.delayed(const Duration(seconds: 2)).then((onValue) => stat);
  }
}
