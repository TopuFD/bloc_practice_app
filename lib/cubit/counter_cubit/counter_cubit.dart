import 'package:block_project/cubit_state/counter_cubit_state/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit():super(InitaialState());

  int counter = 0;

  void increaseCounter() {
    counter++;
    emit(CounterState(counter: counter));
  }

  void decreaseCounter() {
    counter--;
    emit(CounterState(counter: counter));
  }
}
