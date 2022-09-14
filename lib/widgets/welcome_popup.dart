import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

///welcomes the user with style
class WelcomePopupDialog extends StatefulWidget {
  /// Creates a new instance .
  const WelcomePopupDialog(this.welcomeMessage, {Key? key}) : super(key: key);

  /// welcome message text
  final String welcomeMessage;

  @override
  State<WelcomePopupDialog> createState() => _WelcomePopupDialogState();
}

class _WelcomePopupDialogState extends State<WelcomePopupDialog> {
  late final ConfettiController _controllerCenter;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    _controllerCenter.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 360,
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue.withOpacity(0.5),
                    child: const Icon(
                      Icons.tag_faces_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    widget.welcomeMessage,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
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
            ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.05,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }
}
