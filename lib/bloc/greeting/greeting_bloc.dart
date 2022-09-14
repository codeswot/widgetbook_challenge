import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

/// Bloc class for handling Greeting
class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  /// Creates a new instance of [GreetingBloc].
  GreetingBloc() : super(GreetingInitial()) {
    on<AddGreeting>(_onAddGreeting);
    on<AddGreetingError>(_onAddError);
  }
  void _onAddGreeting(
    AddGreeting events,
    Emitter<GreetingState> emit,
  ) {
    emit(GreetingLoaded(greeting: events.greeting));
  }

  void _onAddError(
    AddGreetingError events,
    Emitter<GreetingState> emit,
  ) {
    emit(GreetingError(value: events.message));
  }
}
