import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

class CounterState {
  final int counter;
  CounterState(this.counter);
}

class InitialState extends CounterState {
  InitialState() : super(0);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialState()) {
    on((IncrementCounterEvent envent, emit) {
      emit(CounterState(state.counter + 1));
    });
    on((DecrementCounterEvent envent, emit) {
      emit(CounterState(state.counter - 1));
    });
  }
}
