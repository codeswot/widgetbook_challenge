import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

void main() {
  group('Apis', () {
    final api = WidgetbookApi();
    test('Success Welcome', () async {
      expect(
        await api.welcomeToWidgetbook(message: 'Musa Damu'),
        isInstanceOf<String>(),
      );
    });
  });
}
