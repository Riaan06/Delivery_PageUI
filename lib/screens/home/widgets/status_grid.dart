import 'package:flutter/material.dart';
import 'status_card.dart';

class StatusGrid extends StatelessWidget {
  final String pending;
  final String completed;
  final String cancelled;

  const StatusGrid({
    required this.pending,
    required this.completed,
    required this.cancelled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.85,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        StatusCard(
          title: "Pending",
          count: pending,
          color: Colors.orange,
          icon: Icons.timer,
        ),
        StatusCard(
          title: "Completed",
          count: completed,
          color: Colors.green,
          icon: Icons.check_circle,
        ),
        StatusCard(
          title: "Cancelled",
          count: cancelled,
          color: Colors.red,
          icon: Icons.cancel,
        ),
      ],
    );
  }
}
