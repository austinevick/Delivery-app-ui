import 'dart:io';

import 'package:delivery_app_test/data/utils.dart';
import 'package:delivery_app_test/widget/custom_button.dart';
import 'package:delivery_app_test/widget/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KycTab extends StatefulWidget {
  const KycTab({super.key});

  @override
  State<KycTab> createState() => _KycTabState();
}

class _KycTabState extends State<KycTab> {
  final tabs = ['Individual', 'Business'];
  String selectedTab = 'Individual';
  final idTypes = [
    'Int\'l Passport',
    'Voter\'s Card',
    'National ID',
    'Driver\'s licence'
  ];
  String selectedIDType = 'Int\'l Passport';

  int selectedIndex = 0;
  XFile? imagePicked;
  XFile? idFront;
  XFile? idBack;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildKYCStatusCard(),
        const SizedBox(height: 16),
        buildKYCUpload(),
        const SizedBox(height: 40),
      ],
    );
  }

  CustomButton buildKYCUpload() {
    return CustomButton(
      borderSide: borderSide,
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: selectedIndex == 0 ? uploadPhotoWidget() : uploadValidId()),
    );
  }

  Widget uploadPhotoWidget() => Column(
        children: [
          const Row(
            children: [
              Icon(Icons.image_outlined),
              SizedBox(width: 8),
              Text(
                'Upload a recent photo',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            width: double.infinity,
            child: CustomButton(
              onPressed: () async {
                final file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  imagePicked = file;
                });
              },
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: Center(
                  child: imagePicked != null
                      ? Image.file(File(imagePicked!.path))
                      : const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_circle_outlined),
                            Text('image/jpeg')
                          ],
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: isLoading ? 'Please wait...' : 'Upload',
            color:
                imagePicked != null ? Colors.green[800] : Colors.grey.shade300,
            onPressed: () async {
              setState(() => isLoading = true);
              await Future.delayed(const Duration(milliseconds: 3000))
                  .whenComplete(() => setState(() => selectedIndex = 1));
              setState(() => isLoading = false);
              showSnackbar('Your image was Uploaded successfully');
            },
          ),
        ],
      );

  Widget uploadValidId() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.file_copy),
              SizedBox(width: 8),
              Text(
                'Upload a valid means of identification',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('ID type'),
          DropdownButtonFormField(
            value: selectedIDType,
            items: idTypes
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (val) {},
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: borderSide),
                focusedBorder: OutlineInputBorder(borderSide: borderSide)),
          ),
          const SizedBox(height: 16),
          const Text('Unique ID Identifier'),
          const CustomTextfield(
            readOnly: true,
            hintText: '12345443',
            prefixIcon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: CustomButton(
                  width: 140,
                  onPressed: () async {
                    final file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      idFront = file;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text('ID Front'),
                        idFront == null
                            ? const Icon(
                                Icons.image_outlined,
                                size: 100,
                                color: Colors.grey,
                              )
                            : Image.file(File(idFront!.path), height: 130)
                      ],
                    ),
                  ),
                ),
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                child: CustomButton(
                  width: 140,
                  onPressed: () async {
                    final file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() => idBack = file);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text('ID Back'),
                        idBack == null
                            ? const Icon(
                                Icons.image_outlined,
                                size: 100,
                                color: Colors.grey,
                              )
                            : Image.file(File(idBack!.path), height: 130)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: isLoading ? 'Please wait...' : 'Upload',
            color: idFront != null && idBack != null
                ? Colors.green[800]
                : Colors.grey.shade300,
            onPressed: () async {
              setState(() => isLoading = true);
              await Future.delayed(const Duration(milliseconds: 3000))
                  .whenComplete(() => setState(() => selectedIndex = 1));
              setState(() {
                isLoading = false;
                idFront = null;
                idBack = null;
              });

              showSnackbar('Your data was Uploaded successfully');
            },
          )
        ],
      );

  CustomButton buildKYCStatusCard() {
    return CustomButton(
      borderSide: borderSide,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'KYC Upload',
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
            const SizedBox(height: 16),
            const Text(
                'Kindly make sure you have all the required documents ready to complete the verification process.'),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: selectedIndex == 0 ? Colors.green[900] : Colors.black,
                ),
                const SizedBox(width: 12),
                Text(
                  'Passport Photograph',
                  style: TextStyle(
                      color: selectedIndex == 0
                          ? Colors.green[900]
                          : Colors.black),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.check_circle_outline,
                  color: selectedIndex == 0 ? Colors.green[900] : Colors.black,
                )
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: selectedIndex == 1 ? Colors.green[900] : Colors.black,
                ),
                const SizedBox(width: 12),
                Text(
                  'Valid means of identification\n(Int. Passport, Voter\'s Card)',
                  style: TextStyle(
                    color:
                        selectedIndex == 1 ? Colors.green[900] : Colors.black,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.check_circle_outline,
                  color: selectedIndex == 1 ? Colors.green[900] : Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
