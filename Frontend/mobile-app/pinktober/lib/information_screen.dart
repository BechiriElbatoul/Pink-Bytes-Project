import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  "Welcome Amira ~",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Few more informations we\nneed to know about you",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(height: 40),
                // Gender Dropdown
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                  ),
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                SizedBox(height: 20),
                // Date of Birth Input
                Text(
                  "Date of birth",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Input Default",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Country Dropdown
                Text(
                  "Country",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Quicksand',
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    ),
                  ),
                  items: ['Switzerland', 'Germany', 'France', 'Other']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                SizedBox(height: 20),
                // Family History of Breast Cancer Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    Text(
                      "Family History of Breast Cancer",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Finalize Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "FINALIZE",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/sign_up.png',
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
