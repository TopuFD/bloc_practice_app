import 'package:block_project/cubit_state/user_cubit_state/user_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState>{
  UserCubit():super(InitaialState());


  //===========================================================get user data 

  Future getUsers()async{
    emit(LoadingState());
    
  }




}