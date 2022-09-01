import 'package:mobx/mobx.dart';

// Include generated file
part 'app_store.g.dart';

/// App Store for managing states
class AppStore = _AppStore with _$AppStore;

// The store-class
abstract class _AppStore with Store {
  @observable
  String name = '';

  @observable
  String validationMessage = '';

  @action
  void setName(String inputName) {
    name = inputName;
  }

  @action
  void validateName(String inputName) {
    const pattern = r"^[a-z ,.'-]+$";
    final regExp = RegExp(pattern, caseSensitive: false);
    if (inputName.isEmpty) {
      validationMessage = 'Please enter your Name ☺️';
    } else if (!regExp.hasMatch(inputName)) {
      validationMessage = 'Please enter valid Name ☺️';
    } else {
      validationMessage = '';
    }
  }
}

///global instance of appstore
final appStore = AppStore();
