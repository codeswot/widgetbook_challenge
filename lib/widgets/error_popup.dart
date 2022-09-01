import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';

/// Error dialog
class ErrorPopUpDialog extends StatelessWidget {
  ///
  const ErrorPopUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 350,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.withOpacity(0.5),
              child:
                  const Icon(Icons.error_outline, color: Colors.red, size: 30),
            ),
            const SizedBox(height: 25),
            const Text(
              'An Error Occurred',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            ArgonButton(
              height: 40,
              width: 300,
              minWidth: 150,
              borderRadius: 10,
              onTap: (
                Function start,
                Function stop,
                ButtonState state,
              ) async {
                Navigator.of(context).pop();
              },
              loader: const CircularProgressIndicator(
                color: Colors.white,
              ),
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
