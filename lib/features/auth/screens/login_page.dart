import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:my_app/Widgets/custom_button.dart';
import 'package:my_app/Widgets/custom_row.dart';
import 'package:my_app/Widgets/custom_text_input.dart'; // اتأكد من الملف اللي تحت
import 'package:my_app/Widgets/page_title.dart';
import 'package:my_app/core/widgets/app_logo.dart';
import 'package:my_app/features/auth/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);
    try {
      final email = _emailCtrl.text.trim().replaceAll(RegExp(r'\s'), '');
      final pass  = _passwordCtrl.text.trim();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // مفيش Navigator هنا — الـ StreamBuilder في main.dart هينقل لـ FirstPage
      debugPrint('LOGIN_OK for $email');
    } on FirebaseAuthException catch (e) {
      debugPrint('LOGIN_AUTH_ERR code=${e.code} message=${e.message}');
      String msg = 'Failed to sign in';
      switch (e.code) {
        case 'user-not-found':
          msg = 'No user found for this email';
          break;
        case 'wrong-password':
        case 'invalid-credential':
          msg = 'Wrong password';
          break;
        case 'invalid-email':
          msg = 'Invalid email';
          break;
        case 'user-disabled':
          msg = 'This account is disabled';
          break;
        case 'network-request-failed':
          msg = 'Network error, try again';
          break;
        default:
          msg = e.message ?? msg;
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
      }
    } catch (e) {
      debugPrint('LOGIN_OTHER_ERR $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _resetPassword() async {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اكتب إيميل صحيح الأول')),
      );
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اتبع اللينك اللي جالك على الإيميل')),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('RESET_PASSWORD code=${e.code} message=${e.message}');
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? 'Error')));
    }
  }

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
                  title: 'Login',
                  subTitle: 'Enter your email and password ',
                ),
                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Email',
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Email required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                        inputFormatters: const <TextInputFormatter>[], // اختياري
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        label: 'Password',
                        obscureText: true,
                        controller: _passwordCtrl,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Password required';
                          if (v.length < 6) return 'Min 6 chars';
                          return null;
                        },
                        inputFormatters: const <TextInputFormatter>[], // اختياري
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _resetPassword,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                PrimaryButton(
                  text: _isLoading ? 'Please wait...' : 'Login',
                  onPressed: _isLoading ? null : _signIn,
                  color: const Color(0xFF4CAF50),
                  textColor: Colors.white,
                ),

                const SizedBox(height: 20),
                CustomRow(
                  text: "Don't have an account ?",
                  linkText: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignupPage()),
                    );
                  },
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
