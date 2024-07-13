import 'package:delivery_app_test/widget/custom_back_button.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../data/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get started',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Text('Kindly select a category that best suit you.'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    onPressed: () => setState(() => selectedIndex = 0),
                    color: selectedIndex == 0
                        ? Colors.green.shade50
                        : Colors.transparent,
                    radius: 12,
                    height: 80,
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.person_outline),
                            Text(
                              'New Customer',
                              style: TextStyle(fontSize: 12),
                            )
                          ]),
                    ),
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                      child: CustomButton(
                    onPressed: () => setState(() => selectedIndex = 1),
                    height: 80,
                    radius: 12,
                    color: selectedIndex == 1
                        ? Colors.green.shade50
                        : Colors.transparent,
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.person_outline),
                          Text(
                            'Existing Customer',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'For New Customers',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                  'Upon completion of your signup process, a unique unit number will be automatically generated for your account. You can then use this unit number to log in and access our services.'),
              const SizedBox(height: 40),
              CustomButton(
                onPressed: () => {},
                text: 'Continue',
                color: Colors.green,
              )
            ],
          )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Column(
          children: [
            CustomButton(
              onPressed: () => push(const SignupScreen()),
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
