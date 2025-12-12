// lib/screens/earnings/earnings_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'earnings_controller.dart';
import 'widgets/earnings_card.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EarningsController>();

    if (controller.isLoading) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text('Earnings', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Earnings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            EarningsCard(
              title: "Today's Earnings",
              amount: "₹ ${controller.todayEarnings.toStringAsFixed(0)}",
              percent: "+12%", // can be computed later
            ),
            const SizedBox(height: 12),
            EarningsCard(
              title: "This Week's Earnings",
              amount: "₹ ${controller.weeklyTotal.toStringAsFixed(0)}",
              percent: "+8%",
            ),
            const SizedBox(height: 12),
            EarningsCard(
              title: "This Month's Earnings",
              amount: "₹ ${controller.monthlyTotal.toStringAsFixed(0)}",
              percent: "+15%",
            ),
            const SizedBox(height: 16),

            // The rest of your payout wallet, bonuses, insights,
            // and daily breakdown can stay mostly the same for now,
            // and later you can compute daily list from DummyData.earnings.
          ],
        ),
      ),
    );
  }
}
