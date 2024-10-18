import 'package:flutter/material.dart';
import 'login.dart'; 
import 'Sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hackathon App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SignUpScreen(), 
      debugShowCheckedModeBanner: false, 
    );
  }
}
