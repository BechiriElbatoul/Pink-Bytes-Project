import 'package:flutter/material.dart';

class MedTrackerPage extends StatelessWidget {
  const MedTrackerPage({super.key});

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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFixedImage(),
          ),
          // Content overlay
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Don’t forget your med!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.pink,
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Add Medication',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Smaller medication cards centered
                  _buildMedicationCard(
                      'Medication 1', 'assets/images/meds.png'),
                  _buildMedicationCard(
                      'Medication 2', 'assets/images/meds.png'),
                  _buildMedicationCard(
                      'Medication 3', 'assets/images/meds.png'),
                  _buildMedicationCard(
                      'Medication 4', 'assets/images/meds.png'),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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

  Widget _buildMedicationCard(String medicationName, String iconPath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 50, // Smaller height
      width: 300, // Set a fixed width for the card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconPath, width: 40, height: 40),
              const SizedBox(width: 16),
              Text(
                medicationName,
                style: const TextStyle(
                  fontSize: 16, // Smaller font size
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildFixedImage() {
    return Container(
      width: double.infinity,
      height: 150, // Adjust height to make it smaller
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/woman.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
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
      onTap: (index) {},
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFFFCDD9),
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
