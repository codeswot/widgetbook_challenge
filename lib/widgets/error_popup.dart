import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

/// Error dialog
class ErrorPopUpDialog extends StatelessWidget {
  ///
  const ErrorPopUpDialog(this.message, {Key? key}) : super(key: key);

  ///
  final String message;
  @override
  Widget build(BuildContext context) {
    final _btnController = RoundedLoadingButtonController();
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
            Text(
              message,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            RoundedLoadingButton(
              controller: _btnController,
              onPressed: () async {
                Navigator.of(context).pop();
              },
              height: 60,
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
