import 'package:flutter/material.dart';
import 'package:goodbye_money/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData(
    accentColor: Colors.blue,
    brightness: Brightness.dark,
    primarySwatch: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.blue, secondary: Colors.black)
      ),
      home: TabsController(),
    );
  }
}
