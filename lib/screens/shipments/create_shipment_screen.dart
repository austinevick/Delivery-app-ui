import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/widget/custom_back_button.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:delivery_app_test/widget/custom_textfield.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class CreateShipmentScreen extends StatefulWidget {
  const CreateShipmentScreen({super.key});

  @override
  State<CreateShipmentScreen> createState() => _CreateShipmentScreenState();
}

class _CreateShipmentScreenState extends State<CreateShipmentScreen> {
  final steppers = ['Sender', 'Receiver', 'Delivery', 'Boxes'];
  int selectedIndex = 0;
  final scrollcontroller = ScrollController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.6);
    return PopScope(
      canPop: selectedIndex == 0,
      onPopInvoked: (didPop) {
        if (!didPop) {
          pageController.previousPage(
              duration: Durations.extralong1, curve: Curves.easeIn);
        }
      },
      child: Scaffold(
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
                  'Create Export',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (value) =>
                        setState(() => selectedIndex = value),
                    children: List.generate(
                        steppers.length,
                        (i) => Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: selectedIndex == i
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                  child: Text(
                                    '${i + 1}',
                                    style: TextStyle(
                                        color: selectedIndex == i
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(steppers[i]),
                                i == 3
                                    ? const SizedBox.shrink()
                                    : Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            width: 100,
                                            height: 2,
                                            color: Colors.grey),
                                      )
                              ],
                            )),
                  ),
                ),
                const SizedBox(height: 20),
                switch (selectedIndex) {
                  0 => buildSenderForm(),
                  1 => buildReceiverForm(),
                  2 => buildDeliveryInfo(),
                  3 => buildBoxesForm(),
                  _ => Container()
                },
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  isLoading: selectedIndex == 0,
                  color: selectedIndex == 0 ? Colors.grey : Colors.black,
                  text: 'Previous',
                  onPressed: () => pageController.previousPage(
                      duration: Durations.extralong1, curve: Curves.easeIn),
                ),
                CustomButton(
                  isLoading: selectedIndex == 3,
                  color: selectedIndex == 3 ? Colors.grey : Colors.black,
                  text: 'Next',
                  onPressed: () {
                    pageController.nextPage(
                        duration: Durations.extralong1, curve: Curves.easeIn);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBoxesForm() {
    return Entry.scale(
      duration: animationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Boxes',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const Text('What does your shipment contain?'),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                child: Text(
                    'Kindly toggle the switch to add/remove dimension(s) to your box(es)'),
              ),
              Switch(
                  value: isChecked,
                  onChanged: (val) => setState(() => isChecked = val))
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          label: const Text('Box 1'),
                          icon: const Icon(Icons.add_box_outlined),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          label: const Text('Delete box'),
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    const CustomButton(
                      color: Colors.white70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text('Add Item')],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Click to add new box',
                      style: TextStyle(fontSize: 11),
                    ),
                    icon: const Icon(Icons.add_box_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                        onPressed: () {},
                        radius: 50,
                        text: 'Add new box',
                        color: Colors.black,
                        height: 28,
                        width: 100),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDeliveryInfo() {
    return Entry.scale(
      duration: animationDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Delivery info',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const Text('What type of delivery option do you prefer?'),
          const SizedBox(height: 20),
          const Text('Select Warehouse'),
          DropdownButtonFormField(
            items: [],
            onChanged: (val) {},
            decoration: InputDecoration(
                hintText: 'Choose one',
                enabledBorder: OutlineInputBorder(borderSide: borderSide)),
          ),
          const SizedBox(height: 16),
          const Text('Delivery Type'),
          DropdownButtonFormField(
            items: [],
            onChanged: (val) {},
            decoration: InputDecoration(
                hintText: 'Choose one',
                enabledBorder: OutlineInputBorder(borderSide: borderSide)),
          )
        ],
      ),
    );
  }

  Widget buildReceiverForm() => const Entry.scale(
        duration: animationDuration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Receiver',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text('Search from your saved addresses or create a new address.'),
            SizedBox(height: 20),
            Text(
              'Address Details',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text('Full Address'),
            CustomTextfield(
              hintText: 'Enter full address',
            ),
            SizedBox(height: 20),
            Text(
              'Contact Details',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Row(
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        readOnly: true,
                        hintText: 'ikechukwu@gmail.com',
                        prefixIcon: Icon(Icons.email_outlined),
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
                        'Phone Number',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        readOnly: true,
                        hintText: '08033450054',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Alternate Phone(Optional)',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            CustomTextfield(
              readOnly: true,
              hintText: '08033450054',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ],
        ),
      );

  Widget buildSenderForm() => const Entry.scale(
        duration: animationDuration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Sender',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Text('Search from your saved addresses or create a new address.'),
            SizedBox(height: 20),
            Text(
              'Address Details',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text('Full Address'),
            CustomTextfield(
              hintText: 'Enter full address',
            ),
            SizedBox(height: 20),
            Text(
              'Contact Details',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Row(
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        readOnly: true,
                        hintText: 'ikechukwu@gmail.com',
                        prefixIcon: Icon(Icons.email_outlined),
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
                        'Phone Number',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      CustomTextfield(
                        readOnly: true,
                        hintText: '08033450054',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Alternate Phone(Optional)',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            CustomTextfield(
              readOnly: true,
              hintText: '08033450054',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ],
        ),
      );
}
