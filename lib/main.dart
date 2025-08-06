import 'package:flutter/material.dart';

import 'screens/aggregate_screen.dart';

void main() {
  runApp(AggregateCalculatorApp());
}

class AggregateCalculatorApp extends StatelessWidget {
  const AggregateCalculatorApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aggregate Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AggregateCalculatorScreen(),
    );
  }
}
