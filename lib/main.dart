// 28-08-2026
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/dash" :(context) => DashboardScreen()
      },
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginScreen(),
    );
  }
}