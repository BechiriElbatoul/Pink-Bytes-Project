import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'Sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinktober',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/check', // Ensure this matches the route defined below
      debugShowCheckedModeBanner: false,
      routes: {
        '/check': (context) => HomeScreenPage(),
        '/signup': (context) => SignUpScreen(), // Keep this as is
      },
    );
  }
}
