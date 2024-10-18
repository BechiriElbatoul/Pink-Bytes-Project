import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 32.0, vertical: 16.0), // Increased horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center the main text
          children: [
            const SizedBox(height: 80),
            const Text(
              'Good to see you back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand',
              ),
            ),
            const SizedBox(height: 40),

            // Left aligned Email Label and TextField
            _buildLabel('Email'),
            _buildTextField('Email'),
            const SizedBox(height: 24),

            // Left aligned Password Label and TextField
            _buildLabel('Password'),
            _buildTextField('Password', isPassword: true),
            const SizedBox(height: 16),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot your password?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Centered Login Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  // Login logic
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Centered navigation to create a new account
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Or create a new account',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
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
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Align(
        // Aligning the label to the left
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14, // Updated to 14px
            color: Colors.black87,
            fontFamily: 'Quicksand',
          ),
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
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10), // Adjust padding to make the rectangles smaller
      ),
      style: const TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 14, // Updated to 14px
      ),
    );
  }
}
