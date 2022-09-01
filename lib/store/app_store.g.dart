// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$nameAtom = Atom(name: '_AppStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$validationMessageAtom =
      Atom(name: '_AppStore.validationMessage', context: context);

  @override
  String get validationMessage {
    _$validationMessageAtom.reportRead();
    return super.validationMessage;
  }

  @override
  set validationMessage(String value) {
    _$validationMessageAtom.reportWrite(value, super.validationMessage, () {
      super.validationMessage = value;
    });
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void setName(String inputName) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setName');
    try {
      return super.setName(inputName);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String inputName) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.validateName');
    try {
      return super.validateName(inputName);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
validationMessage: ${validationMessage}
    ''';
  }
}
