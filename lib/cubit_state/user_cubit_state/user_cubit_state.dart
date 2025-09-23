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
class DataLoadedState extends UserCubitState {
  List userList = [];
  @override
  List<Object?> get props => [userList];
}

//===================================================error state
class ErrorState extends UserCubitState {
  String message;
  ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
