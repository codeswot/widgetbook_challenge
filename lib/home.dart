import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/greeting/greeting_bloc.dart';
import 'package:widgetbook_challenge/services/app_services.dart';
import 'package:widgetbook_challenge/widgets/widgets.dart';

/// The Home View of the WidgetBook App
class Home extends StatelessWidget {
  /// Creates a new instance of [Home].

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    return BlocListener<GreetingBloc, GreetingState>(
      listener: (context, state) {
        if (state is GreetingLoaded) {
          showDialog<void>(
            context: context,
            builder: (context) => WelcomePopupDialog(state.greeting),
          );
        } else if (state is GreetingError) {
          showDialog<void>(
            context: context,
            builder: (context) => ErrorPopUpDialog(state.value),
          );
        } else {
          AppServices().clearForm(context, controller: _nameController);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Hello Flutter enthusiast!'),
                const SizedBox(height: 100),
                GreetingForm(_nameController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
