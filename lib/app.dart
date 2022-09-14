import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/bloc/bloc.dart';
import 'package:widgetbook_challenge/home.dart';
import 'package:widgetbook_challenge/store/constants.dart';

/// The app.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GreetingBloc(),
        ),
        BlocProvider(
          create: (context) =>
              NameBloc()..add(const AddNameError(message: emptyField)),
        ),
      ],
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}
