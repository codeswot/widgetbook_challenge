part of 'greeting_bloc.dart';

/// Event class for handling Greeting events
abstract class GreetingEvent extends Equatable {
  /// Creates a new instance of [GreetingEvent].
  const GreetingEvent();
  @override
  List<Object?> get props => [];
}

/// Event class for handling Greeting events
class AddGreeting extends GreetingEvent {
  /// Creates a new instance of [AddGreeting].
  const AddGreeting({this.greeting = ''});

  ///instance of new name
  final String greeting;
  @override
  List<Object?> get props => [greeting];
}

/// Event class for handling Greeting error events
class AddGreetingError extends GreetingEvent {
  /// Creates a new instance of [AddGreetingError].
  const AddGreetingError({required this.message});

  ///instance of new validation message
  final String message;
  @override
  List<Object?> get props => [message];
}
