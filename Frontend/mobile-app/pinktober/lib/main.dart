import 'package:flutter/material.dart';
import 'check.dart';

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
        '/check': (context) => CheckPage(), // Keep this as is
      },
    );
  }
}
