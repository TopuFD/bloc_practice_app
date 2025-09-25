import 'package:block_project/cubit/counter_cubit/counter_cubit.dart';
import 'package:block_project/cubit/user_cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocProvider {
  static List<BlocProvider> get providers => [
    BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
    BlocProvider<UserCubit>(create: (context) => UserCubit()),
  ];
}
