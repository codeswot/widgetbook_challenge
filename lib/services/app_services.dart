import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/store/app_store.dart';

///App Services
class AppServices {
  final _widgetBookApi = WidgetbookApi();

  /// validates and submits to api
  Future<String?> submitValidation(GlobalKey<FormState> formKey) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      try {
        final res =
            await _widgetBookApi.welcomeToWidgetbook(message: appStore.name);
        return res;
      } catch (e) {
        if (kDebugMode) {
          print('err $e');
        }
        return null;
      }
    }
    return '';
  }
}
