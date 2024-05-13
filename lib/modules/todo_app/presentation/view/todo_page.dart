import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_bloc.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_event.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenteredButtonPage extends StatelessWidget {
  CenteredButtonPage({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey,
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
            if (state is ToDoPostSuccessState) {
              BlocProvider.of<ToDoBloc>(context).add(ToDoInitialEvent());
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                if (state is ToDoSuccessState)
                  SizedBox(
                      height: 400,
                      width: 500,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.toDoAttributeModel.items?.length,
                          itemBuilder: (context, index) {
                            var title =
                                state.toDoAttributeModel.items?[index].title;
                            var description = state
                                .toDoAttributeModel.items?[index].description;
                            print(title);
                            print(description);
                            return ListTile(
                                tileColor: Colors.grey.shade200,
                                title: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Title : $title \n",
                                        style: const TextStyle(fontSize: 16)),
                                    TextSpan(
                                        text: "Description : $description \n",
                                        style: const TextStyle(fontSize: 16)),
                                  ]),
                                ));
                          },
                        ),
                      ))
                else
                  const SizedBox(
                    height: 400,
                    width: 500,
                  ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "enter Title",
                          ),
                          controller: BlocProvider.of<ToDoBloc>(context)
                              .titleController,
                          onSaved: (value) {
                            BlocProvider.of<ToDoBloc>(context)
                                    .titleController
                                    .text ==
                                value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty || value == "") {
                              return 'Please enter a title'; // Validation error message
                            }
                            return value; // Return null if the input is valid
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "enter Description",
                          ),
                          controller: BlocProvider.of<ToDoBloc>(context)
                              .descriptionController,
                          onSaved: (value) {
                            BlocProvider.of<ToDoBloc>(context)
                                    .descriptionController
                                    .text ==
                                value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty || value == "") {
                              return 'Please enter a description'; // Validation error message
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<ToDoBloc>(context)
                                  .add(ToDoPostInitialEvent());
                              // BlocProvider.of<ToDoBloc>(context).add(ToDOHiveInitialEvent());
                            }
                          },
                          child: const Text("Submit"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
