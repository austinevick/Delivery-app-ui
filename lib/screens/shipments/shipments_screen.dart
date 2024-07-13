import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/widget/custom_back_button.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:flutter/material.dart';

class ShipmentsScreen extends StatelessWidget {
  const ShipmentsScreen({super.key});

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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipments Breakdown',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text('Here you view shipments breakdown'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Shipment Details',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Customer Information'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Sender Information'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Receiver Information'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Warehouse Information'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Order Summary',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Text('Ref Number: EX-AIES-000001-000021'),
                const Row(
                  children: [
                    Text('Shipment Method: '),
                    Text(
                      'Africanies Air Standard',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Box 1'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Additional Charges'),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Chargeable Weight'), Text('1kg')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Total item value'), Text('N0.00')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('VAT (Fixed)'), Text('7.5%')],
                ),
                const Divider(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Shipping costs'), Text('N742,065.00')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Insurance costs'), Text('N11,318.88')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Additional costs'), Text('N0.00')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Inclusive tax costs'), Text('N60,000.00')],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total costs'),
                    Text(
                      'N742,065.00',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  borderSide: borderSide,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount Paid',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'C\$674.91',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Paid using'),
                    Text(
                      'Stripe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
