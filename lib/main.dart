// lib/main.dart
import 'package:deliveryui/screens/auth/auth_controller.dart';
import 'package:deliveryui/screens/auth/login_page.dart';
import 'package:deliveryui/screens/deliveries/deliveries_controller.dart';
import 'package:deliveryui/screens/earnings/earnings_controller.dart';
import 'package:deliveryui/screens/home/home_controller.dart';
import 'package:deliveryui/screens/nav/bottom_nav.dart';
import 'package:deliveryui/screens/nav/nav_controller.dart';
import 'package:deliveryui/screens/profile/profile_controller.dart';
import 'package:deliveryui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // DO NOT sign out here – let Firebase keep the session
  final User? user = FirebaseAuth.instance.currentUser;
  final bool isLoggedIn = user != null;

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
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MaterialApp(
        title: 'Tiffinity Delivery Partner',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        // ⬇️ START WITH SPLASH SCREEN
        home: SplashScreen(isLoggedIn: isLoggedIn),
        // ⬇️ ADD ROUTES
        routes: {
          '/home': (context) => const BottomNav(),
          '/login': (context) => const LoginPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
