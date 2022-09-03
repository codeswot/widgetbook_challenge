// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:widgetbook_challenge/extensions/string_extension.dart';
import 'package:widgetbook_challenge/services/app_services.dart';

part 'app_store.g.dart';

///
class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final FormErrorState error = FormErrorState();

  @observable
  String name = '';

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateName),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  void validateName(String inputName) {
    const pattern = r"^[a-z ,.'-]+$";
    final regExp = RegExp(pattern, caseSensitive: false);
    if (inputName.isEmpty) {
      error.name = 'Please enter your Name ☺️';
    } else if (!regExp.hasMatch(inputName)) {
      error.name = 'Please enter valid Name ☺️';
    } else {
      error.name = null;
    }
  }

  @action
  // ignore: use_setters_to_change_properties
  void setName(String inputName) {
    name = inputName.toTitleCase();
  }

  void validateAll() {
    validateName(name);
  }

  @action
  Future<void> submitApi(BuildContext context) async {
    validateAll();
    final _appServices = AppServices();
    if (!error.hasErrors) {
      await _appServices.submit(context);
    }
  }
}

///
class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? name;

  @computed
  bool get hasErrors => name != null;
}

///global class instance
final appStore = AppStore();
