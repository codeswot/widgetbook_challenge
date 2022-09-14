import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:widgetbook_challenge/bloc/name/name_bloc.dart';
import 'package:widgetbook_challenge/services/app_services.dart';

/// Widget UI View to handle form submission
class GreetingForm extends StatefulWidget {
  /// Creates a new instance of [GreetingForm].
  const GreetingForm({Key? key}) : super(key: key);

  @override
  State<GreetingForm> createState() => _GreetingFormState();
}

class _GreetingFormState extends State<GreetingForm> {
  final _btnController = RoundedLoadingButtonController();
  final AppServices _appServices = AppServices();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              onChanged: (String? value) =>
                  _appServices.formValidation(context, input: value ?? ''),
              decoration: InputDecoration(
                hintText: 'Enter your name',
                filled: true,
                errorText: (state is NameError) ? state.value : null,
              ),
            ),
            const SizedBox(height: 100),
            RoundedLoadingButton(
              controller: _btnController,
              onPressed: (state is NameError)
                  ? null
                  : () async {
                      if (state is NameAdded) {
                        _btnController.start();
                        await _appServices.submit(
                          context,
                          name: state.name,
                          mounted: mounted,
                        );
                      }
                      _btnController.stop();
                    },
              height: 60,
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
