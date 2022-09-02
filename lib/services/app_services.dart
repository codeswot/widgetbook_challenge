import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/store/app_store.dart';
import 'package:widgetbook_challenge/widgets/error_popup.dart';
import 'package:widgetbook_challenge/widgets/welcome_popup.dart';

///App Services
class AppServices {
  final _widgetBookApi = WidgetbookApi();

  /// validates and submits to api
  Future<void> submitValidation(
    BuildContext context,
  ) async {
    try {
      final res =
          await _widgetBookApi.welcomeToWidgetbook(message: appStore.name);
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => WelcomePopupDialog(res),
      );
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred$e');
      }
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ErrorPopUpDialog(),
      );
    }
  }
}
