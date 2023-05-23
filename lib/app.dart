import 'package:calculatorapp/screen/calculator_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      initialRoute: '/',
      routes: {
        '/': (context) => const CalculatorScreen(),
      },
    );
  }
}
