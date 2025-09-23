import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable {
  const CounterCubitState();
}

class InitaialState extends CounterCubitState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class CounterState extends CounterCubitState {
  int counter;
  CounterState({required this.counter});
  @override
  List<Object?> get props => [counter];
}
