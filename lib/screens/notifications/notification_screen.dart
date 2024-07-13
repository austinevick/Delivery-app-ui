import 'package:delivery_app_test/widget/custom_back_button.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...notifications.reversed.map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomButton(
                        color: e.isRead ? Colors.green[50] : Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.local_shipping_outlined,
                                color: Colors.green,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      e.message,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          e.time,
                                          style: const TextStyle(
                                              fontSize: 10, color: Colors.grey),
                                        ),
                                        !e.isRead
                                            ? const SizedBox()
                                            : const CustomButton(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'VIEW MORE',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.green),
                                                    ),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.green,
                                                    )
                                                  ],
                                                ),
                                              )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: !e.isRead
                                    ? Colors.transparent
                                    : Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}

final notifications = [
  Notification(
      'Your shipment was successfully booked. Your tracking number is 122333444445',
      '21 hours ago',
      false),
  Notification(
      'Your shipment with ID EX-AIES-000001-00000021 has just been packaged.',
      '22 hours ago',
      false),
  Notification(
      'Your shipment was successfully booked. Your tracking number is 122333444445',
      '21 hours ago',
      false),
  Notification(
      'Your shipment was successfully booked. Your tracking number is 122333444445',
      '21 hours ago',
      true),
  Notification(
      'Your shipment with ID EX-AIES-000001-00000021 has just been packaged.',
      '22 hours ago',
      true),
  Notification(
      'Your shipment was successfully booked. Your tracking number is 122333444445',
      '21 hours ago',
      true)
];

class Notification {
  final String message;
  final String time;
  final bool isRead;

  Notification(this.message, this.time, this.isRead);
}
