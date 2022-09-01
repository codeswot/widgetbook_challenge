import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:widgetbook_challenge/extensions/string_extension.dart';
import 'package:widgetbook_challenge/services/app_services.dart';
import 'package:widgetbook_challenge/store/app_store.dart';
import 'package:widgetbook_challenge/widgets/error_popup.dart';
import 'package:widgetbook_challenge/widgets/welcome_popup.dart';

/// The app.
class App extends StatefulWidget {
  /// Creates a new instance of [App].
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _formKey = GlobalKey<FormState>();
  final _appServices = AppServices();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          appStore.validateName(value!);
                          if (appStore.validationMessage.isNotEmpty) {
                            return appStore.validationMessage;
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String? value) {
                          appStore.setName(value!.firstLetterInCaps());
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 100),
                      const Text('Hello Flutter enthusiast!'),
                      const SizedBox(height: 100),
                      ArgonButton(
                        height: 65,
                        width: 300,
                        minWidth: 150,
                        borderRadius: 10,
                        onTap: (
                          Function start,
                          Function stop,
                          ButtonState state,
                        ) async {
                          start();
                          final res =
                              await _appServices.submitValidation(_formKey);
                          stop();
                          if (res != null) {
                            if (res.isNotEmpty) {
                              await showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => WelcomePopupDialog(res),
                              );
                            }
                          } else {
                            await showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const ErrorPopUpDialog(),
                            );
                          }
                        },
                        loader: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
