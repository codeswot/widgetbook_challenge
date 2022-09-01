import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/vectors/cute-orange-cat-waving-paw-cartoon-vector-illustration-vector-id1317718144?k=20&m=1317718144&s=612x612&w=0&h=_IvCcZwBKSacvWjUxnNjJLtu0PSWEGYJbypd0Nfz3XU='),
                    radius: 50,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    widget.welcomeMessage,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  ArgonButton(
                    height: 45,
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
