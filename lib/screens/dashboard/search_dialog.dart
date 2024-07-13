import 'package:flutter/material.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_textfield.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Enter your tracking number to proceed',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const CustomTextfield(
              autoFocus: true,
              hintText: 'search by tracking number',
            ),
            const SizedBox(height: 16),
            CustomButton(
              color: Colors.green[800],
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
