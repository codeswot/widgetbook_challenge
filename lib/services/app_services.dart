import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/bloc/bloc.dart';
import 'package:widgetbook_challenge/store/constants.dart';

///App Services, handles functionalities of app
class AppServices {
  final _widgetBookApi = WidgetbookApi();

  /// validates the name form before submisions
  void formValidation(BuildContext context, {required String input}) {
    final regExp = RegExp(pattern, caseSensitive: false);
    if (input.isEmpty) {
      context.read<NameBloc>().add(const AddNameError(message: emptyField));
    } else if (!regExp.hasMatch(input)) {
      context.read<NameBloc>().add(const AddNameError(message: invalidField));
    } else {
      context.read<NameBloc>().add(AddName(name: input));
    }
  }

  ///method to submit name to api and add response to Bloc event
  Future<void> submit(
    BuildContext context, {
    required String name,
    required bool mounted,
  }) async {
    try {
      final res = await _widgetBookApi.welcomeToWidgetbook(message: name);
      if (!mounted) return;

      context.read<GreetingBloc>().add(AddGreeting(greeting: res));
    } catch (e) {
      context
          .read<GreetingBloc>()
          .add(const AddGreetingError(message: 'An Error Occurred'));
    }
  }

  /// method to clear form and reset state to initial
  void clearForm(
    BuildContext context, {
    required TextEditingController controller,
  }) {
    context.read<NameBloc>().add(
          const AddNameError(message: emptyField),
        );
    controller.clear();
  }
}
