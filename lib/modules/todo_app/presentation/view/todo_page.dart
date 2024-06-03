import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';
import 'package:dms/modules/todo_app/domain/entity/todo_entity_model.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_bloc.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_event.dart';
import 'package:dms/modules/todo_app/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

TodoAttributeItems? _selectedItem;

final _formKey = GlobalKey<FormState>();

class _TodoPageState extends State<TodoPage> {
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
            } else if (state is ToDoDeleteSuccessState) {
              BlocProvider.of<ToDoBloc>(context).add(ToDoInitialEvent());
            } else if (state is ToDoEditSuccessState) {
              BlocProvider.of<ToDoBloc>(context).add(ToDoInitialEvent());
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<ToDoBloc>(context)
                            .add(SearchTasksEvent());
                      },
                      controller: BlocProvider.of<ToDoBloc>(context)
                          .searchTextController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  if (state is ToDoSuccessState)
                    SizedBox(
                        height: 400,
                        width: 500,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: BlocProvider.of<ToDoBloc>(context,
                                        listen: false)
                                    .searchedTaskSlots
                                    .isEmpty
                                ? state.toDoAttributeModel.items?.length
                                : BlocProvider.of<ToDoBloc>(context,
                                        listen: false)
                                    .searchedTaskSlots
                                    .length,
                            itemBuilder: (context, index) {
                              var item = state.toDoAttributeModel.items?[index];

                              var title = BlocProvider.of<ToDoBloc>(context,
                                          listen: false)
                                      .searchedTaskSlots
                                      .isEmpty
                                  ? (state.toDoAttributeModel.items?[index]
                                          .title ??
                                      "")
                                  : BlocProvider.of<ToDoBloc>(context,
                                          listen: false)
                                      .searchedTaskSlots[index]
                                      .title;

                              var description = BlocProvider.of<ToDoBloc>(
                                          context,
                                          listen: false)
                                      .searchedTaskSlots
                                      .isEmpty
                                  ? (state.toDoAttributeModel.items?[index]
                                          .description ??
                                      "")
                                  : BlocProvider.of<ToDoBloc>(context,
                                          listen: false)
                                      .searchedTaskSlots[index]
                                      .description;

                              return Dismissible(
                                key: Key(_selectedItem?.id ?? ""),
                                onDismissed: (direction) {
                                  BlocProvider.of<ToDoBloc>(context).add(
                                      ToDoDeleteInitialEvent(
                                          _selectedItem?.id ?? ""));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          _selectedItem = item;
                                          BlocProvider.of<ToDoBloc>(context)
                                              .titleController
                                              .text = title ?? '';
                                          BlocProvider.of<ToDoBloc>(context)
                                              .descriptionController
                                              .text = description ?? '';
                                        });
                                      },
                                      tileColor: Colors.grey.shade200,
                                      title: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "Title : $title \n",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                          TextSpan(
                                              text:
                                                  "Description : $description \n",
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ]),
                                      )),
                                ),
                              );
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
                            key: const Key('title_field'),
                            decoration: const InputDecoration(
                              hintText: "enter Title",
                            ),
                            controller: BlocProvider.of<ToDoBloc>(context)
                                .titleController,
                            // onSaved: (value) {
                            //   BlocProvider.of<ToDoBloc>(context)
                            //           .titleController
                            //           .text ==
                            //       value;
                            // },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a title'; // Validation error message
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "enter Description",
                            ),
                            controller: BlocProvider.of<ToDoBloc>(context)
                                .descriptionController,
                            // onSaved: (value) {
                            //   BlocProvider.of<ToDoBloc>(context)
                            //           .descriptionController
                            //           .text ==
                            //       value;
                            // },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value == "") {
                                return 'Please enter a description'; // Validation error message
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();

                                      if (_selectedItem == null) {
                                        BlocProvider.of<ToDoBloc>(context)
                                            .add(ToDoPostInitialEvent());
                                      } else {
                                        BlocProvider.of<ToDoBloc>(context).add(
                                            ToDoDeleteInitialEvent(
                                                _selectedItem?.id ?? ""));

                                        setState(() {
                                          _selectedItem = null;
                                        });
                                      }
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            _selectedItem == null
                                                ? Colors.grey
                                                : Colors.red.shade200),
                                  ),
                                  child: Text(
                                    _selectedItem == null ? "Submit" : "Delete",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Visibility(
                                visible: _selectedItem != null,
                                child: Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        BlocProvider.of<ToDoBloc>(context).add(
                                            ToDoEditInitialEvent(
                                                _selectedItem?.id ?? ""));

                                        setState(() {
                                          _selectedItem = null;
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.yellow.shade100),
                                    ),
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
