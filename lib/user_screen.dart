
import 'package:block_project/cubit/user_cubit/user_cubit.dart';
import 'package:block_project/cubit_state/user_cubit_state/user_cubit_state.dart';
import 'package:block_project/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state) {
          return Column(
            children: [
              (state is LoadingState)
                  ? Center(child: CircularProgressIndicator(color: Colors.blue))
                  : (state is ErrorState)
                  ? Center(child: Text(state.message))
                  : (state is DataLoadedState)
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(state.userList.length, (index) {
                            UserModel userData = state.userList[index];
                            return ListTile(
                              leading: Text(
                                userData.id.toString(),
                                style: nameStyle,
                              ),
                              title: Text(userData.name, style: nameStyle),
                              subtitle: Text(userData.email, style: emailStyle),
                            );
                          }),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          );
        },
      ),
    );
  }

  TextStyle nameStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  TextStyle emailStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
