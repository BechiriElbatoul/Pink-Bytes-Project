import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'Family_history.dart';
import 'scanner.dart';
import 'scan.dart';

class ScanCosmeticsPage extends StatelessWidget {
  const ScanCosmeticsPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Scan Your Cosmetics for Harmful Ingredients',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE17489),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to ScanIngredientsPage
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScanIngredientsPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'SCAN HERE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Scanned products:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 16),
              _buildProductInfo(),
              const SizedBox(height: 24),
              const Text(
                'Harmful product rating:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 8),
              _buildRiskBar(context),
              const SizedBox(height: 8),
              const Text(
                'Description goes here.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Quicksand',
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

  Widget _buildProductInfo() {
    final List<String> ingredientIcons = [
      'assets/images/incorrect.png',
      'assets/images/incorrect.png',
      'assets/images/incorrect.png',
      'assets/images/correct.png',
      'assets/images/correct.png',
    ];

    final List<String> ingredientNames = [
      'Harmful ingredient',
      'Harmful ingredient',
      'Harmful ingredient',
      'Safe ingredient',
      'Safe ingredient',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product name:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ingredient list:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(ingredientIcons.length, (index) {
          final isHarmful = ingredientNames[index].contains('Harmful');

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Image.asset(
                  ingredientIcons[index],
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ingredientNames[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: isHarmful ? Colors.red : Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRiskBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Risk',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '20%',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 148, 163),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
