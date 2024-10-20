import 'package:flutter/material.dart';
import 'information_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/images/sign_img.png',
                  height: 250, // Increased image height
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _buildLabel('First Name')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildLabel('Last Name')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField('First Name')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Last Name')),
                ],
              ),
              const SizedBox(height: 24),
              _buildLabel('Email'),
              _buildTextField('Email'),
              const SizedBox(height: 24),
              _buildLabel('Password'),
              _buildTextField('Password', isPassword: true),
              const SizedBox(height: 8),
              const Text(
                'Check your email for the verification code.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildLabel('Confirm Password'),
              _buildTextField('Confirm Password', isPassword: true),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationScreen()),
                    );
                  },
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14, // Font size
          color: Colors.black87,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false}) {
    return TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.pinkAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.pinkAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.pink, width: 2),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          hintStyle: const TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 14,
          ),
        ));
  }
}
