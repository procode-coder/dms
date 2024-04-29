import 'package:dms/modules/todo_app/data/model/todo_model.dart';

abstract class ToDoState {}

class TODoInitial extends ToDoState {}

class TODoBackstate extends ToDoState {}

class TODOFailState extends ToDoState {}

class ToDoSuccessState extends ToDoState {
  ToDoModel todoModel;
  ToDoSuccessState(this.todoModel);
}
