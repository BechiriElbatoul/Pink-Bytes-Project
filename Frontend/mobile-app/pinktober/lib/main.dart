import 'package:flutter/material.dart';
import 'Sign_up.dart';
import 'Home_page.dart';
import 'Med_tracker.dart';
import 'Add_member.dart';
import 'Family_history.dart';
import 'scanner.dart';
import 'scan.dart';
import 'homescreen.dart';

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
      initialRoute: '/screen',
      debugShowCheckedModeBanner: false,
      routes: {
        '/screen': (context) => HomeScreenPage(),
        '/scan': (context) => ScanIngredientsPage(),
        '/scanner': (context) => ScanCosmeticsPage(),
        '/FamilyHistory': (context) => FamilyHistoryPage(),
        '/AddMember': (context) => AddFamilyMemberPage(),
        '/MedTracker': (context) => MedTrackerPage(),
        '/homepage': (context) => HomePage(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}
