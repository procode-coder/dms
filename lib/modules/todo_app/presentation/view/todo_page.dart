import 'package:dms/modules/todo_app/presentation/bloc/todo_bloc.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_event.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenteredButtonPage extends StatelessWidget {
  const CenteredButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centered Button Page'),
      ),
      body: BlocProvider(
        create: (context) => ToDoBloc()..add(ToDoInitialEvent()),
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ToDoBloc>(context).add(ToDoInitialEvent());
                },
                child: const Text('Centered Button'),
              ),
            );
          },
        ),
      ),
    );
  }
}
