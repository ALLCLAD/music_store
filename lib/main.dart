import 'package:e_instru/screens/auth_screen/login_screen.dart';
import 'package:e_instru/screens/auth_screen/subscription_screen.dart';
import 'package:e_instru/screens/panier_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: C4),

      ),
      home: const PanierPage(),
    );
  }
}

