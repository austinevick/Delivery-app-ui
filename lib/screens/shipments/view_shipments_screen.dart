import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:delivery_app_test/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app_test/widget/custom_back_button.dart';

class ViewShipmentsScreen extends StatefulWidget {
  const ViewShipmentsScreen({super.key});

  @override
  State<ViewShipmentsScreen> createState() => _ViewShipmentsScreenState();
}

class _ViewShipmentsScreenState extends State<ViewShipmentsScreen> {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: AppBar(leading: const CustomBackButton()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'View Shipments',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('Here you view and manage available shipments'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 100),
                      child: CustomTextfield(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) =>
                        [const PopupMenuItem(child: Text('Export'))],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                  onSelectAll: (value) {},
                  headingRowColor: WidgetStatePropertyAll(Colors.green[50]),
                  columns: const [
                    DataColumn(label: Text('Shipment ID')),
                    DataColumn(label: Text('Date Created')),
                    DataColumn(label: Text('Tracking Number')),
                    DataColumn(label: Text('Destination')),
                    DataColumn(label: Text('Shipment Status')),
                    DataColumn(label: Text('Approval Status')),
                    DataColumn(label: Text('Payment Status')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: shipmentData
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e.shipmentId, style: style)),
                            DataCell(Text(e.dateCreated, style: style)),
                            DataCell(Text(e.trackingNumber, style: style)),
                            DataCell(Text(e.destination, style: style)),
                            DataCell(Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10,
                                  color:
                                      getShipmentStatusColor(e.shipmentStatus),
                                ),
                                const SizedBox(width: 6),
                                Text(e.shipmentStatus, style: style),
                              ],
                            )),
                            DataCell(Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.circle,
                                        size: 10, color: Colors.green.shade800),
                                    const SizedBox(width: 6),
                                    Text(e.approvalStatus, style: style),
                                  ],
                                ),
                                Text(
                                  e.approvalDate,
                                  style: style.copyWith(
                                      fontSize: 9, color: Colors.grey[600]),
                                ),
                              ],
                            )),
                            DataCell(CustomButton(
                                width: 80,
                                height: 35,
                                color: Colors.green[50],
                                child: Text(
                                  e.paymentStatus,
                                  style:
                                      style.copyWith(color: Colors.green[900]),
                                ))),
                            DataCell(CustomButton(
                                width: 80,
                                height: 35,
                                color: Colors.grey[100],
                                child: Text(e.action, style: style))),
                          ]))
                      .toList()),
            )
          ],
        ),
      )),
    );
  }

  Color getShipmentStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.grey;
      case 'In-process':
        return Colors.blue.shade800;
    }
    return Colors.transparent;
  }
}

class Shipment {
  final String shipmentId;
  final String dateCreated;
  final String trackingNumber;
  final String destination;
  final String shipmentStatus;
  final String approvalStatus;
  final String paymentStatus;
  final String approvalDate;
  final String action;
  Shipment({
    required this.shipmentId,
    required this.dateCreated,
    required this.trackingNumber,
    required this.destination,
    required this.shipmentStatus,
    required this.approvalStatus,
    required this.paymentStatus,
    required this.approvalDate,
    required this.action,
  });
}

final shipmentData = [
  Shipment(
      shipmentId: 'EX-AIES-000001-000021',
      dateCreated: 'July 10, 2024',
      trackingNumber: '---',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'Pending',
      approvalDate: 'July 10,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: 'Waybill'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000016',
      dateCreated: 'July 9, 2024',
      trackingNumber: 'Duplicate-7847647483832',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 10,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000015',
      dateCreated: 'July 8, 2024',
      trackingNumber: '7847647455554',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000010',
      dateCreated: 'July 8, 2024',
      trackingNumber: 'Duplicate-7847647483832',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000015',
      dateCreated: 'July 8, 2024',
      trackingNumber: '7847647455554',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000010',
      dateCreated: 'July 8, 2024',
      trackingNumber: 'Duplicate-7847647483832',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000015',
      dateCreated: 'July 8, 2024',
      trackingNumber: '7847647455554',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000010',
      dateCreated: 'July 8, 2024',
      trackingNumber: 'Duplicate-7847647483832',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000015',
      dateCreated: 'July 8, 2024',
      trackingNumber: '7847647455554',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
  Shipment(
      shipmentId: 'EX-AIES-000001-000010',
      dateCreated: 'July 8, 2024',
      trackingNumber: 'Duplicate-7847647483832',
      destination: 'Greater Accra Region, Ghana',
      shipmentStatus: 'In-process',
      approvalDate: 'July 8,2024,4:34:26 PM',
      approvalStatus: 'Approved',
      paymentStatus: 'Paid',
      action: '...'),
];
