import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:widgetbook_challenge/extensions/string_extension.dart';
import 'package:widgetbook_challenge/store/app_store.dart';

/// The app.
class App extends StatefulWidget {
  /// Creates a new instance of [App].

  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    appStore.setupValidations();
    super.initState();
  }

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Observer(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Interview Challenge'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      onChanged: (String? value) =>
                          appStore.setName(value!.toTitleCase()),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        filled: true,
                        errorText: appStore.error.name,
                      ),
                    ),
                    const SizedBox(height: 100),
                    const Text('Hello Flutter enthusiast!'),
                    const SizedBox(height: 100),
                    RoundedLoadingButton(
                      controller: _btnController,
                      onPressed: () async {
                        _btnController.start();
                        await appStore.submitApi(context);
                        _btnController.stop();
                      },
                      height: 60,
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    appStore.dispose();
    super.dispose();
  }
}
