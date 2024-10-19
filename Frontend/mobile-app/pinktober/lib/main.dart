import 'package:flutter/material.dart';
import 'Sign_up.dart';
import 'login.dart';
import 'Home_page.dart';

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
      initialRoute: '/homepage',
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
