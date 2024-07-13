import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/screens/auth/forgot_password_screen.dart';
import 'package:delivery_app_test/screens/auth/signup_screen.dart';
import 'package:delivery_app_test/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app_test/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  bool obscureText = true;
  void toggleText() => setState(() => obscureText = !obscureText);
  Widget buildIcon() => IconButton(
      onPressed: () => toggleText(),
      icon: Icon(
        obscureText ? Icons.visibility_off_outlined : Icons.visibility,
      ));

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Login to your\naccount',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text('Enter your details to login.'),
                      const SizedBox(height: 16),
                      const Text(
                        'Enter email',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        controller: email,
                        hintText: 'Enter email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        onChanged: (value) => setState(() {}),
                        validator: (value) =>
                            value!.isEmpty ? 'Field is required' : null,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Enter password',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        controller: password,
                        hintText: 'Enter password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        obscureText: obscureText,
                        suffixIcon: buildIcon(),
                        onChanged: (value) => setState(() {}),
                        validator: (value) =>
                            value!.isEmpty ? 'Field is required' : null,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (val) {}),
                          const Text('Remember me'),
                          const Spacer(),
                          TextButton(
                              onPressed: () =>
                                  push(const ForgotPasswordScreen()),
                              child: const Text(
                                'Forgot password',
                                style: TextStyle(color: Colors.green),
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            push(const DashboardScreen());
                          }
                        },
                        color: email.text.isNotEmpty && password.text.isNotEmpty
                            ? Colors.green[800]
                            : Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                color: email.text.isNotEmpty &&
                                        password.text.isNotEmpty
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward,
                              color: email.text.isNotEmpty &&
                                      password.text.isNotEmpty
                                  ? Colors.white
                                  : Colors.black,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Column(
          children: [
            CustomButton(
              onPressed: () => push(const SignupScreen()),
              radius: 12,
              width: 185,
              borderSide: BorderSide(color: Colors.grey.shade300),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New user?'),
                  SizedBox(width: 8),
                  Text(
                    'Sign up',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
