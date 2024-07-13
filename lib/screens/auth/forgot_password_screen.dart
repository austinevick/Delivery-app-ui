import 'package:flutter/material.dart';

import '../../data/utils.dart';
import '../../widget/custom_back_button.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';
import 'signup_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lets\'s recover\nyour account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {},
                  color: Colors.grey.shade300,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Send me a link'),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ],
            ),
          )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Column(
          children: [
            CustomButton(
              onPressed: () => push(const SignupScreen()),
              width: 250,
              borderSide: BorderSide(color: Colors.grey.shade300),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New user?'),
                  SizedBox(width: 8),
                  Text(
                    'Create Account',
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
