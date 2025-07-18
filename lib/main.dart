import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Emergencia911App());
}

class Emergencia911App extends StatelessWidget {
  const Emergencia911App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergencia 911',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
    );
  }
}
