import 'package:deliveryui/screens/%20auth/login_page.dart';
import 'package:deliveryui/screens/deliveries/deliveries_controller.dart';
import 'package:deliveryui/screens/earnings/earnings_controller.dart';
import 'package:deliveryui/screens/home/home_controller.dart';
import 'package:deliveryui/screens/nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/nav/nav_controller.dart';
import 'screens/profile/profile_controller.dart';

void main() {
  runApp(const DeliveryBoyApp());
}

class DeliveryBoyApp extends StatelessWidget {
  const DeliveryBoyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),

        /// ✅ FIXED HERE
        ChangeNotifierProvider(create: (_) => HomeController()),

        ChangeNotifierProvider(create: (_) => DeliveriesController()),
        ChangeNotifierProvider(create: (_) => EarningsController()),
      ],
      child: MaterialApp(
        title: 'Delivery Boy',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
