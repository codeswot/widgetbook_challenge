part of 'greeting_bloc.dart';

///Abstract class for Greeting States
abstract class GreetingState extends Equatable {
  /// Creates a new instance of [GreetingState].
  const GreetingState();
  @override
  List<Object?> get props => [];
}

/// Initial state for greeting
class GreetingInitial extends GreetingState {}

/// State of loaded greeting
class GreetingLoaded extends GreetingState {
  /// Creates a new instance of [GreetingLoaded].
  const GreetingLoaded({this.greeting = ''});

  /// instance of greeting
  final String greeting;
  @override
  List<Object> get props => [greeting];
}

/// State of error greeting
class GreetingError extends GreetingState {
  /// Creates a new instance of [GreetingError].
  const GreetingError({required this.value});

  /// instance of name
  final String value;
  @override
  List<Object> get props => [value];
}
