// lib/main.dart
import 'package:deliveryui/screens/auth/login_page.dart';

import 'package:deliveryui/screens/deliveries/deliveries_controller.dart';
import 'package:deliveryui/screens/earnings/earnings_controller.dart';
import 'package:deliveryui/screens/home/home_controller.dart';
import 'package:deliveryui/screens/nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/nav/nav_controller.dart';
import 'screens/profile/profile_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(DeliveryBoyApp(isLoggedIn: isLoggedIn));
}

class DeliveryBoyApp extends StatelessWidget {
  final bool isLoggedIn;

  const DeliveryBoyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
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
        home: isLoggedIn ? const BottomNav() : const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
