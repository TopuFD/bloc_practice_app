
import 'package:equatable/equatable.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class InitaialState extends UserCubitState {
  @override
  List<Object?> get props => [];
}

//=====================================================loading state

class LoadingState extends UserCubitState {
  @override
  List<Object?> get props => [];
}

//=======================================================data loaded state
// ignore: must_be_immutable
class DataLoadedState extends UserCubitState {
  List userList = [];

  DataLoadedState({required this.userList});
  @override
  List<Object?> get props => [userList];
}

//===================================================error state
// ignore: must_be_immutable
class ErrorState extends UserCubitState {
  String message;
  ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
