import 'dart:developer';

import 'package:block_project/cubit_state/user_cubit_state/user_cubit_state.dart';
import 'package:block_project/model/user_model.dart';
import 'package:block_project/service/api_service.dart';
import 'package:block_project/service/app_url.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  List userList = [];
  UserCubit() : super(InitaialState());

  //===========================================================get user data

  Future getUsers() async {
    emit(LoadingState());
    try {
      var response = await ApiService.getData(uri: AppUrl.userUrl);
    if (response.statusCode == 200) {
      List data = response.body;

      userList = data.map((value) => UserModel.fromJson(value)).toList();
      log("User list=======================$userList");
      emit(DataLoadedState(userList: userList));
    }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
