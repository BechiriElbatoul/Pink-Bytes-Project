import 'package:flutter/material.dart';

class MedTrackerPage extends StatefulWidget {
  const MedTrackerPage({super.key});

  @override
  _MedTrackerPageState createState() => _MedTrackerPageState();
}

class _MedTrackerPageState extends State<MedTrackerPage> {
  // Keep track of the checkbox states
  List<bool> _medicationChecked = [false, false, false, false];

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t forget your med!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      const SizedBox(width: 10),
                      RawMaterialButton(
                        onPressed: () {
                          // Add your logic for the '+' button here
                        },
                        fillColor: const Color(0xFFEBA1AE),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10.0),
                        constraints: const BoxConstraints.tightFor(
                          width: 36.0,
                          height: 36.0,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildMedicationCard(
                      'Medication 1', 'assets/images/meds.png', 0),
                  _buildMedicationCard(
                      'Medication 2', 'assets/images/meds.png', 1),
                  _buildMedicationCard(
                      'Medication 3', 'assets/images/meds.png', 2),
                  _buildMedicationCard(
                      'Medication 4', 'assets/images/meds.png', 3),
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

  Widget _buildMedicationCard(
      String medicationName, String iconPath, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFCDD9), width: 2),
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand',
                ),
              ),
            ],
          ),
          Checkbox(
            value: _medicationChecked[index],
            onChanged: (bool? value) {
              setState(() {
                _medicationChecked[index] = value ?? false;
              });
            },
            activeColor: const Color(0xFFEBA1AE),
          ),
        ],
      ),
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

  Widget _buildFixedImage() {
    return Container(
      width: 220,
      height: 220,
      decoration: const BoxDecoration(
        image: DecorationImage(
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
      selectedItemColor: const Color.fromARGB(255, 251, 251, 251),
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
