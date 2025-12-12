import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  final List<double> values;
  final List<String> days;

  const WeeklyChart({
    super.key,
    required this.values,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    final maxValue = values.reduce((a, b) => a > b ? a : b);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(values.length, (index) {
          final heightFactor = values[index] / maxValue;

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                height: 120 * heightFactor,
                width: 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 6),
              Text(days[index], style: TextStyle(fontSize: 12)),
            ],
          );
        }),
      ),
    );
  }
}
