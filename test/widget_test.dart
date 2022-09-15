import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:widgetbook_challenge/app.dart';

void main() {
  testWidgets('$App contains Widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Hello Flutter enthusiast!'), findsOneWidget);
    expect(
      find.widgetWithText(TextFormField, 'Enter your name'),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(RoundedLoadingButton, 'Continue'),
      findsOneWidget,
    );
  });
}
