import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/bloc/app_observer.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(const App());
}
