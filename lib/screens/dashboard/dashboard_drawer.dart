import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app_test/screens/settings/settings_screen.dart';
import 'package:delivery_app_test/screens/shipments/create_shipment_screen.dart';
import 'package:delivery_app_test/screens/shipments/shipments_screen.dart';
import 'package:delivery_app_test/screens/shipments/view_shipments_screen.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app_test/widget/custom_button.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person_outline),
            ),
            const SizedBox(height: 10),
            const Text('Ikechukwu Kalu'),
            const Text(
              'AIES-0000001',
              style: TextStyle(
                color: Colors.green,
                fontSize: 17,
              ),
            ),
            const Divider(),
            Expanded(
                child: ListView.builder(
              itemCount: _drawerItems.length,
              itemBuilder: (context, i) => ExpansionTile(
                  onExpansionChanged: (value) {
                    if (i == 1) {
                      Future.delayed(Durations.extralong4)
                          .whenComplete(() => push(const ShipmentsScreen()));
                    }
                  },
                  shape: InputBorder.none,
                  title: Text(_drawerItems[i].title),
                  leading: Icon(_drawerItems[i].icon),
                  children: List.generate(
                      _drawerItems[i].tiles.length,
                      (ix) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomButton(
                              width: double.infinity,
                              color: tileColor(
                                  _drawerItems[i].tiles.length,
                                  Colors.green.shade50,
                                  _drawerItems[i].tiles[ix].isExpanded),
                              textColor: Colors.black,
                              onPressed: () {
                                handleNavigation(
                                    _drawerItems[i].tiles[ix].text);
                                setState(() {
                                  if (_drawerItems[i].tiles.length > 1) {
                                    _drawerItems[i].tiles[ix].isExpanded =
                                        !_drawerItems[i].tiles[ix].isExpanded;
                                  }
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 48),
                                      child:
                                          Text(_drawerItems[i].tiles[ix].text)),
                                  Container(
                                    width: 10,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        color: tileColor(
                                            _drawerItems[i].tiles.length,
                                            Colors.green[800]!,
                                            _drawerItems[i]
                                                .tiles[ix]
                                                .isExpanded)),
                                  )
                                ],
                              ),
                            ),
                          ))),
            )),
            const ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }

  void handleNavigation(String value) {
    switch (value) {
      case 'Home':
        pop();
        push(const DashboardScreen());
      case 'Create Shipments':
        pop();
        push(const CreateShipmentScreen());
      case 'View Shipments':
        pop();
        push(const ViewShipmentsScreen());
      case 'User Settings':
        pop();
        push(const SettingsScreen());
    }
  }

  Color tileColor(int length, Color color, bool isSelected) {
    if (length == 1) {
      return color;
    } else if (length > 1) {
      if (isSelected) {
        return color;
      }
    } else {
      return color;
    }
    return Colors.transparent;
  }
}

final _drawerItems = [
  DrawerItems(
      icon: Icons.grid_on_outlined,
      title: 'Dashboard',
      tiles: [Tile(text: 'Home')]),
  DrawerItems(
      icon: Icons.local_shipping,
      title: 'Shipments',
      tiles: [Tile(text: 'Create Shipments'), Tile(text: 'View Shipments')]),
  DrawerItems(
      icon: Icons.settings_outlined,
      title: 'Settings',
      tiles: [Tile(text: 'User Settings')]),
];

class Tile {
  final String text;
  bool isExpanded;
  Tile({
    required this.text,
    this.isExpanded = false,
  });
}

class DrawerItems {
  final IconData icon;
  final String title;

  final List<Tile> tiles;
  DrawerItems({
    required this.icon,
    required this.title,
    required this.tiles,
  });
}
