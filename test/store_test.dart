import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/store/app_store.dart';

void main() {
  group('Store', () {
    final appStore = AppStore();
    test('Name should start empty', () {
      expect(appStore.name, '');
    });

    test('Name should be set to a (String)', () {
      appStore.setName('Musa Damu');

      expect(appStore.name, 'Musa Damu');
    });

    test('Name should be (string) without a numeric character', () {
      appStore.validateName('Musa Damu');

      expect(appStore.error.name, null);
    });

    test('Name should be completely empty (String)', () {
      appStore.validateName('');

      expect(appStore.error.name, 'Please enter your Name ☺️');
    });

    test('Name should contain numeric character', () {
      appStore.validateName('Musa Damu3');

      expect(appStore.error.name, 'Please enter valid Name ☺️');
    });
  });
}
