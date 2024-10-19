import 'package:flutter/material.dart';
import 'Sign_up.dart';
import 'login.dart';
import 'Home_page.dart';
import 'Med_tracker.dart';
import 'Add_member.dart';

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
      initialRoute: '/AddMember',
      debugShowCheckedModeBanner: false,
      routes: {
        '/AddMember': (context) => AddFamilyMemberPage(),
        '/MedTracker': (context) => MedTrackerPage(),
        '/homepage': (context) => HomePage(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
