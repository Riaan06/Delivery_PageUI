// lib/screens/nav/bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_page.dart';
import '../deliveries/deliveries_page.dart';
import '../earnings/earnings_page.dart';
import '../profile/profile_page.dart';
import 'nav_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  List<Widget> get _pages => const [
    HomePage(),
    DeliveriesPage(),
    EarningsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavController>(
      builder: (context, nav, _) {
        return Scaffold(
          body: _pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: nav.currentIndex,
            onTap: nav.changeTab,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining_outlined),
                label: 'Deliveries',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: 'Earnings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
