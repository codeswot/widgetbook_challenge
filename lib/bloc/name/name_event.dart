part of 'name_bloc.dart';

/// Event class for handling name events
abstract class NameEvent extends Equatable {
  /// Creates a new instance of [NameEvent].
  const NameEvent();
  @override
  List<Object?> get props => [];
}

/// Event class for handling adding name events
class AddName extends NameEvent {
  /// Creates a new instance of [NameEvent].
  const AddName({this.name = ''});

  ///instance of new name
  final String name;
  @override
  List<Object?> get props => [name];
}

/// Event class for adding error events
class AddNameError extends NameEvent {
  /// Creates a new instance of [AddNameError].
  const AddNameError({this.message});

  ///instance of new validation message
  final String? message;
  @override
  List<Object?> get props => [message];
}
