class EarningModel {
  final String date;      // YYYY-MM-DD
  final int deliveries;   // number of deliveries that day
  final int amount;       // amount earned that day

  EarningModel({
    required this.date,
    required this.deliveries,
    required this.amount,
  });
}
