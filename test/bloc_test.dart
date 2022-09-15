import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/bloc/bloc.dart';
import 'package:widgetbook_challenge/store/constants.dart';

void main() {
  group('GreetingBloc', () {
    blocTest<GreetingBloc, GreetingState>(
      'emits <GreetingInitial>[] when nothing is added',
      build: GreetingBloc.new,
      expect: () => <GreetingInitial>[],
    );

    blocTest<GreetingBloc, GreetingState>(
      'emits <GreetingLoaded>[Hello Musa Damu] when AddGreeting is added',
      build: GreetingBloc.new,
      act: (bloc) => bloc.add(const AddGreeting(greeting: 'Welcome Musa Damu')),
      expect: () =>
          <GreetingLoaded>[const GreetingLoaded(greeting: 'Welcome Musa Damu')],
    );
    blocTest<GreetingBloc, GreetingState>(
      'emits <GreetingError>[An error occurred] when AddGreeting is added',
      build: GreetingBloc.new,
      act: (bloc) =>
          bloc.add(const AddGreetingError(message: 'An error occurred')),
      expect: () =>
          <GreetingError>[const GreetingError(value: 'An error occurred')],
    );
  });
  group('NameBloc', () {
    blocTest<NameBloc, NameState>(
      'emits <NameInitial>[] when nothing is added',
      build: NameBloc.new,
      expect: () => <NameInitial>[],
    );

    blocTest<NameBloc, NameState>(
      'emits <NameAdded>[Musa Damu] when NameAdded is added',
      build: NameBloc.new,
      act: (bloc) => bloc.add(const AddName(name: 'Musa Damu')),
      expect: () => <NameAdded>[const NameAdded(name: 'Musa Damu')],
    );
    blocTest<NameBloc, NameState>(
      'emits <NameError>[Please enter your Name ☺️] when NameError is added',
      build: NameBloc.new,
      act: (bloc) => bloc.add(const AddNameError(message: emptyField)),
      expect: () => <NameError>[const NameError(value: emptyField)],
    );
    blocTest<NameBloc, NameState>(
      'emits <NameError>[Please enter a valid Name ☺️] when NameError is added',
      build: NameBloc.new,
      act: (bloc) => bloc.add(const AddNameError(message: invalidField)),
      expect: () => <NameError>[const NameError(value: invalidField)],
    );
  });
}
