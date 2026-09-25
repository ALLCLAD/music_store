import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';
import 'widgets/colors.dart';

void main() {
  runApp(
      const ProviderScope(

          child: MyApp(),

      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Store',

      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: C4),

      ),

      home: const HomePage(),

    );

  }
}

