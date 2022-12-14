import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';

import 'mock/mock_api.dart';

void main() {
  group('Apis', () {
    late WidgetbookApi api;
    api = MockApi();

    test('Success Welcome', () async {
      when(() => api.welcomeToWidgetbook(message: 'Musa Damu'))
          .thenAnswer((_) async => 'Welcome Musa Damu');

      expect(
        await api.welcomeToWidgetbook(message: 'Musa Damu'),
        'Welcome Musa Damu',
      );
    });
  });
}
