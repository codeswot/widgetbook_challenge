import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:widgetbook_challenge/bloc/bloc.dart';
import 'package:widgetbook_challenge/services/app_services.dart';

/// Widget UI View to handle form submission
class GreetingForm extends StatefulWidget {
  /// Creates a new instance of [GreetingForm].
  const GreetingForm(this.nameController, {Key? key}) : super(key: key);

  /// controller for name form
  final TextEditingController nameController;

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
              controller: widget.nameController,
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
                      if (!mounted) return;
                      context.read<GreetingBloc>().add(const InitialGreeting());

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
