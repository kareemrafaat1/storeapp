import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/features/auth/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    try {
      final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      );

      await cred.user?.updateDisplayName(_nameCtrl.text.trim());

      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Account created successfully!')));

      // مفيش Navigator هنا — الـ StreamBuilder في main.dart هينقل تلقائي لـ FirstPage
      // لو عايز تحوّل يدوي فورًا: Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      debugPrint('SIGNUP_ERROR code=${e.code} message=${e.message}');
      String msg;
      switch (e.code) {
        case 'email-already-in-use':
          msg = 'الإيميل مستخدم قبل كده';
          break;
        case 'invalid-email':
          msg = 'الإيميل غير صحيح';
          break;
        case 'weak-password':
          msg = 'الباسورد ضعيف (على الأقل 6 حروف)';
          break;
        case 'operation-not-allowed':
          msg = 'Email/Password مش متفعّل في Firebase';
          break;
        case 'network-request-failed':
          msg = 'مشكلة في الإنترنت';
          break;
        default:
          msg = e.message ?? 'حصل خطأ غير متوقع أثناء إنشاء الحساب';
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (e) {
      debugPrint('SIGNUP_ERROR other=$e');
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TimeOfDay.now().format(context)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.signal_cellular_4_bar, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 37, height: 42, child: Image.asset('assets/images/Vector.png')),
                const SizedBox(height: 20),
                const Text('Sign Up', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'User name required';
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Email required';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Password required';
                          if (v.length < 6) return 'Min 6 chars';
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),
                Text(
                  'By continuing you agree to our Terms of Service and Privacy Policy.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(_isLoading ? 'Please wait...' : 'Sign Up', style: const TextStyle(fontSize: 18)),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: const Text('Login', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
