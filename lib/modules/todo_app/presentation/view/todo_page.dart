import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
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
        title: const Text('ToDo App'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ToDoBloc()..add(ToDoInitialEvent()),
          ),
        ],
        child: BlocConsumer<ToDoBloc, ToDoState>(
          listener: (context, state) {
            print(state);
            if (state is ToDoPostSuccessState) {
              print("hii");
              BlocProvider.of<ToDoBloc>(context).add(ToDoInitialEvent());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                if (state is ToDoSuccessState)
                  SizedBox(
                      height: 400,
                      width: 400,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.toDoAttributeModel.items?.length,
                          itemBuilder: (context, index) {
                            var title =
                                state.toDoAttributeModel.items?[index].title;
                            var description = state
                                .toDoAttributeModel.items?[index].description;

                            // print(data?.color ?? "hey");
                            return ListTile(
                                title: RichText(
                              text: TextSpan(children: [
                                TextSpan(text: "Title : $title \n"),
                                TextSpan(text: "Description : $description \n"),
                              ]),
                            ));
                          },
                        ),
                      )),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ListView(
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "enter Title"),
                        controller:
                            BlocProvider.of<ToDoBloc>(context).titleController,
                      ),
                      TextField(
                          decoration:
                              InputDecoration(hintText: "enter Description"),
                          controller: BlocProvider.of<ToDoBloc>(context)
                              .descriptionController),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ToDoBloc>(context)
                                .add(ToDoPostInitialEvent());
                          },
                          child: const Text("Submit"))
                    ],
                  ),
                ),
              ],
            );
            // if (state is ToDoSuccessState) {
            //   return
            // }
          },
        ),
      ),
    );
  }
}
