part of 'name_bloc.dart';

/// State handling
abstract class NameState extends Equatable {
  /// Creates a new instance of [NameState].
  const NameState();
  @override
  List<Object?> get props => [];
}

/// Initial state for name
class NameInitial extends NameState {}

/// State of loaded name
class NameAdded extends NameState {
  /// Creates a new instance of [NameAdded].
  const NameAdded({this.name = ''});

  /// instance of name
  final String name;
  @override
  List<Object> get props => [name];
}

/// State of error name
class NameError extends NameState {
  /// Creates a new instance of [NameError].
  const NameError({required this.value});

  /// instance of name
  final String? value;
  @override
  List<Object?> get props => [value];
}
