import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'Family_history.dart';
import 'scanner.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/sign_up.png'),
            ),
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: _buildSideBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LET\'S BEGIN',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Quicksand',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Here are some videos on how you can do self-checks at home:',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Quicksand',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCheckSquare(height: 120),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 140, // Adjusted for spacing between squares
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCheckSquare(height: 120),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCheckSquare(height: 120),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 180,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCheckSquare(height: 120),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/High.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'note that self examination doesn’t replace experts checks , so make sure you see one ! ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/tafla.png',
                  width: 130,
                  height: 130,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCheckSquare({required double height}) {
    return Container(
      width: 120, // Adjust width as needed
      height: height, // Pass the height as parameter
      decoration: BoxDecoration(
        color: const Color(0xFFE17489), // Pink color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30, // Adjust size as needed
            ),
            const SizedBox(height: 8), // Space between icon and text
            const Text(
              'Watch Now',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Quicksand',
                fontSize: 14, // Adjust font size as needed
              ),
            ),
          ],
        ),
      ),
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
