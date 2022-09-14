import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_event.dart';
part 'name_state.dart';

/// Bloc class for handling name
class NameBloc extends Bloc<NameEvent, NameState> {
  /// Creates a new instance of [NameBloc].
  NameBloc() : super(NameInitial()) {
    on<AddName>(_onAddName);
    on<AddNameError>(_onValidateName);
  }

  void _onAddName(
    AddName events,
    Emitter<NameState> emit,
  ) {
    emit(NameAdded(name: events.name));
  }

  void _onValidateName(
    AddNameError events,
    Emitter<NameState> emit,
  ) {
    emit(NameError(value: events.message));
  }
}
