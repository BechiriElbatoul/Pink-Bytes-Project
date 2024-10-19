import 'package:flutter/material.dart';
import 'settings.dart';
import 'Family_history.dart';
import 'scanner.dart';

class AddFamilyMemberPage extends StatelessWidget {
  const AddFamilyMemberPage({super.key});

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
      body: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '    Add a family member',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Quicksand',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '       ID',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Quicksand',
              ),
            ),
            const SizedBox(height: 8),

            Center(
              child: SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFEBA1AE), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter ID',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Centered buttons
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Add Family Member',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Black text color
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 235, 202, 208),
                        textStyle: const TextStyle(
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('or'),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Scan QR Code logic
                      },
                      child: const Text(
                        'Scan QR Code',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 235, 202, 208),
                        textStyle: const TextStyle(
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: Image.asset(
                'assets/images/QR.png',
                width: 100,
                height: 100,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '                     Scan your QR code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset(
                'assets/images/familyy.png',
                width: 300,
                height: 220,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          _buildBottomNavigationBar(context), // Pass context here
    );
  }

  Drawer _buildSideBar(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
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
                'Symptoms', 'assets/images/Hypertension.png', context),
            _buildSidebarButton(
                'Self Check', 'assets/images/Black Woman Bra.png', context),
          ],
        ),
      ),
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
}
