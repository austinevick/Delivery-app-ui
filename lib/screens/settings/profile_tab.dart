import 'package:flutter/material.dart';

import '../../data/utils.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final tabs = ['Details', 'Password'];
  String selectedTab = 'Details';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          borderSide: borderSide,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green[50],
                  child: const Text('IK'),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Ikechukwu Kalu Emmanuel',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  'emmanuel@gmail.com',
                ),
                const Text(
                  'Date Joined: 06/07/2024',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          borderSide: borderSide,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Address',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[50],
                      child: const Icon(Icons.place),
                    ),
                    const SizedBox(width: 8),
                    const Text('Tap to add additional address'),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total addresses saved'),
                    CustomButton(
                      text: '3',
                      width: 30,
                      height: 30,
                      color: Colors.orange,
                    )
                  ],
                ),
                const CustomButton(
                  text: 'Tap here to view all',
                  textColor: Colors.green,
                  textAlign: Alignment.centerLeft,
                  width: 150,
                  height: 35,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          borderSide: borderSide,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Details',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('---'),
                        Text(
                          'Business Name',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Individual'),
                        Text(
                          'Account Type',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          borderSide: borderSide,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 36,
                  width: 200,
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
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'First Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          CustomTextfield(
                            readOnly: true,
                            hintText: 'Ikechukwu',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          CustomTextfield(
                            readOnly: true,
                            hintText: 'Kalu',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Middle Name',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          CustomTextfield(
                            readOnly: true,
                            hintText: 'Emmanuel',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Unit Number',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          CustomTextfield(
                            readOnly: true,
                            hintText: 'Kalu',
                            prefixIcon: Icon(Icons.numbers_outlined),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const CustomTextfield(
                  readOnly: true,
                  hintText: 'emmanuel@gmail.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phone Number',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const CustomTextfield(
                  readOnly: true,
                  hintText: '08033450054',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                const SizedBox(height: 30),
                const CustomButton(
                  text: 'Update Account',
                  textColor: Colors.green,
                  borderSide: BorderSide(color: Colors.green),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        CustomButton(
          width: double.infinity,
          borderSide: borderSide,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Coming soon!',
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Refer a business and earn!',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Share your referral link with a business and earn N5000 when they signup and book a shipment.',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Share the referral link',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Share the referral link by copying and sharing it on social media.',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 8),
                CustomButton(
                  borderSide: borderSide,
                  color: Colors.grey.shade100,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'HGTUOJHLO234',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Copy link',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
