import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/screens/dashboard/dashboard_drawer.dart';
import 'package:delivery_app_test/screens/notifications/notification_screen.dart';
import 'package:delivery_app_test/screens/shipments/create_shipment_screen.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'search_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool visibilityValue = false;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: visibilityValue
            ? FloatingActionButton(
                onPressed: () => push(const CreateShipmentScreen()),
                child: const Icon(Icons.add_circle_outline),
              )
            : FloatingActionButton.extended(
                onPressed: () => push(const CreateShipmentScreen()),
                label: const Row(
                  children: [
                    Icon(Icons.add_circle_outline),
                    SizedBox(width: 8),
                    Text('Create Shipment')
                  ],
                ),
              ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (ctx) => SearchDialog());
                },
                icon: const Icon(Icons.search_outlined)),
            Stack(
              children: [
                IconButton(
                    onPressed: () => push(const NotificationScreen()),
                    icon: const Icon(Icons.notifications_outlined)),
                const Positioned(
                    right: 5,
                    top: 5,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 8,
                        child: Text(
                          '3',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ))
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_outline_rounded))
          ],
        ),
        drawer: const DashboardDrawer(),
        body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 14),
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
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Ikechukwu",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text('Welcome here!'),
                          ],
                        ),
                        buildWalletBalance(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    buildShipmentDetails(),
                    const SizedBox(height: 16),
                    buildKYCCard(),
                    const SizedBox(height: 16),
                    buildAddressCard(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildShipmentStatus(Icons.local_shipping_outlined,
                            Colors.blue, 'Total Shipments'),
                        const SizedBox(width: 10),
                        buildShipmentStatus(Icons.timeline_outlined,
                            Colors.yellow, 'Shipments in Transit'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildShipmentStatus(Icons.done_all_outlined,
                            Colors.green, 'Delivered Shipments'),
                        const SizedBox(width: 10),
                        buildShipmentStatus(Icons.remove_circle_outline,
                            Colors.red, 'Cancelled Shipments'),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )));
  }

  Widget buildShipmentStatus(
    IconData icon,
    Color color,
    String text,
  ) {
    return Expanded(
      child: CustomButton(
        borderSide: borderSide,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 17, color: color),
                  const SizedBox(width: 6),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 12),
                  )
                ],
              ),
              const Text('0', style: numberTextStyle)
            ],
          ),
        ),
      ),
    );
  }

  CustomButton buildAddressCard() {
    return CustomButton(
      borderSide: borderSide,
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Saved Address'),
                Text('3', style: numberTextStyle),
                Text('View')
              ],
            ),
            Icon(Icons.map_outlined, size: 50)
          ],
        ),
      ),
    );
  }

  CustomButton buildKYCCard() {
    return CustomButton(
      borderSide: borderSide,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('KYC Progress'),
                const Text('100%', style: numberTextStyle),
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const SizedBox(
                        width: 150, child: LinearProgressIndicator(value: 1)))
              ],
            ),
            const Icon(Icons.bar_chart_outlined, size: 50)
          ],
        ),
      ),
    );
  }

  Widget buildWalletBalance() => CustomButton(
        borderSide: borderSide,
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'Coming soon!',
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              Text(
                'Wallet Balance',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text('N0.00', style: numberTextStyle)
            ],
          ),
        ),
      );

  CustomButton buildShipmentDetails() {
    return CustomButton(
      borderSide: borderSide,
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Number of Shipment this month',
                  style: TextStyle(),
                ),
                Text(
                  '0',
                  style: numberTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '%',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(' against last month'),
                  ],
                )
              ],
            ),
            Divider(),
            Column(
              children: [
                Text(
                  'Total shipping cost for this month',
                  style: TextStyle(),
                ),
                Text(
                  'N0.00',
                  style: numberTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '%',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(' against last month'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
