import 'package:flutter/material.dart';
import 'package:my_app/Widgets/custom_button.dart';
import 'package:my_app/auth/screens/login_page.dart';
import 'package:my_app/auth/widgets/app_logo.dart';
import 'package:my_app/auth/widgets/custom_row.dart';
import 'package:my_app/auth/widgets/custom_text_input.dart';
import 'package:my_app/auth/widgets/page_title.dart';
import 'package:my_app/home/home_screen.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Center(child: AppLogo(size: 50)),
                const SizedBox(height: 20),
                const PageTitle(
                    title: 'Sign Up',
                    subTitle: 'Enter your details to create an account'),
                const SizedBox(height: 30),
                const CustomTextField(label: 'Username'),
                const SizedBox(height: 20),
                const CustomTextField(label: 'Email'),
                const SizedBox(height: 20),
                const CustomTextField(
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'By signing up, you agree to our Terms of Service and Privacy Policy.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Sign Up',
                  onPressed: () {
                    // Handle sign up logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  color: const Color(0xFF4CAF50),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 20),
                CustomRow(
                  text: 'Already have an account?',
                  linkText: 'Login',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
