import 'package:block_project/cubit/counter_cubit/counter_cubit.dart';
import 'package:block_project/cubit_state/counter_cubit_state/counter_cubit_state.dart';
import 'package:block_project/cubit/user_cubit/user_cubit.dart';
import 'package:block_project/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextStyle textStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), centerTitle: true),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  context.read<UserCubit>().getUsers();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UserScreen()),
                  );
                },
                child: Text("User Screen"),
              ),
              SizedBox(height: 20),
              (state is CounterState)
                  ? Text(state.counter.toString())
                  : Text("0"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increaseCounter();
                    },
                    child: Text("Increase"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decreaseCounter();
                    },
                    child: Text("Decrease"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
