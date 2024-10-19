import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'Family_history.dart';
import 'scanner.dart';

class ScanIngredientsPage extends StatelessWidget {
  const ScanIngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/sign_up.png'),
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu,
                  color: Color.fromARGB(255, 58, 56, 56)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: _buildSideBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              const Text(
                'Scan Your Cosmetics for Harmful Ingredients',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 90),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFE17489),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Couldn\'t find?',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Scan your product\'s ingredients',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 214, 163, 180),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 216, 167, 183)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Drawer _buildSideBar(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'We are proud of you, track your journey now!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildSidebarButton(
              'symptoms', 'assets/images/Hypertension.png', context),
          _buildSidebarButton(
              'self check', 'assets/images/Black Woman Bra.png', context),
        ],
      ),
    );
  }

  Widget _buildSidebarButton(
      String text, String iconPath, BuildContext context) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(text),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/Home.png', width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/nav 1.png', width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/nav 2.png', width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/nav 3.png', width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/nav 4.png', width: 24, height: 24),
          label: '',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        if (index == 2) {
          // Navigate to ScanCosmeticsPage
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScanCosmeticsPage(),
            ),
          );
        } else if (index == 3) {
          // Navigate to FamilyHistoryPage
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FamilyHistoryPage(),
            ),
          );
        } else if (index == 4) {
          // Navigate to SettingsPage
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ),
          );
        }
        // Handle other navigation items if needed
      },
      backgroundColor: Colors.white,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
    );
  }
}
