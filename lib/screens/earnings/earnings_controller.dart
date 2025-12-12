// lib/controllers/earnings_controller.dart
import 'package:flutter/material.dart';

import '../../data/repository/earnings_repository.dart';

class EarningsController extends ChangeNotifier {
  final EarningsRepository _repo = EarningsRepository();

  double todayEarnings = 0;
  double weeklyTotal = 0;
  double monthlyTotal = 0;

  List<double> weeklyChartData = [];
  List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  bool isLoading = false;

  EarningsController() {
    loadEarnings();
  }

  Future<void> loadEarnings() async {
    isLoading = true;
    notifyListeners();

    todayEarnings = await _repo.fetchTodayEarnings();
    weeklyTotal = await _repo.fetchWeeklyEarnings();
    monthlyTotal = await _repo.fetchMonthlyEarnings();
    weeklyChartData = await _repo.fetchWeeklyChartData();

    isLoading = false;
    notifyListeners();
  }
}
