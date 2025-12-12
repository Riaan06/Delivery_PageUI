class EarningsRepository {
  Future<double> fetchTodayEarnings() async => 540.0;

  Future<double> fetchWeeklyEarnings() async => 3500.0;

  Future<double> fetchMonthlyEarnings() async => 14000.0;

  Future<List<double>> fetchWeeklyChartData() async =>
      [200, 500, 350, 700, 450, 300, 800];
}
