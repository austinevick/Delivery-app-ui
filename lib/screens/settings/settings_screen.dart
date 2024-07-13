import 'package:delivery_app_test/screens/settings/kyc_tab.dart';
import 'package:delivery_app_test/screens/settings/profile_tab.dart';
import 'package:delivery_app_test/screens/settings/security_tab.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../widget/custom_back_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final tabs = ['Profile', 'KYC', 'Security'];
  String selectedTab = 'Profile';

  bool visibilityValue = false;

  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      floatingActionButton: visibilityValue
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.phone_outlined),
            )
          : FloatingActionButton.extended(
              label: const Row(
                children: [
                  Icon(Icons.phone_outlined),
                  SizedBox(width: 8),
                  Text('Contact support')
                ],
              ),
              onPressed: () {}),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollController.position.userScrollDirection ==
                  ScrollDirection.forward) {
                setState(() => visibilityValue = false);
              } else if (scrollController.position.userScrollDirection ==
                  ScrollDirection.reverse) {
                setState(() => visibilityValue = true);
              }

              return true;
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 36,
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.green[50],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            tabs.length,
                            (i) => CustomButton(
                                  color: selectedTab == tabs[i]
                                      ? Colors.green[800]
                                      : Colors.transparent,
                                  text: tabs[i],
                                  textColor: selectedTab == tabs[i]
                                      ? Colors.white
                                      : Colors.black,
                                  onPressed: () => setState(() {
                                    selectedTab = tabs[i];
                                  }),
                                )),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  switch (selectedTab) {
                    'Profile' => const ProfileTab(),
                    'KYC' => const KycTab(),
                    'Security' => const SecurityTab(),
                    _ => Container()
                  },
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}
