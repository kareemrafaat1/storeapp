import 'package:flutter/material.dart';

import 'package:my_app/Widgets/custom_button.dart';
import 'package:my_app/auth/screens/signup_page.dart';
import 'package:my_app/auth/widgets/app_logo.dart';
import 'package:my_app/auth/widgets/page_title.dart';
import 'package:my_app/auth/widgets/custom_row.dart';
import 'package:my_app/auth/widgets/custom_text_input.dart';
import 'package:my_app/home/home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    title: 'Loging',
                    subTitle: 'Enter your email and password '),
                const SizedBox(height: 30),
                const CustomTextField(label: 'Email'),
                const SizedBox(height: 20),
                const CustomTextField(
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Login',
                  onPressed: () {
                    // Handle login logic here
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
                  text: 'Don\'t have an account ?',
                  linkText: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
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
