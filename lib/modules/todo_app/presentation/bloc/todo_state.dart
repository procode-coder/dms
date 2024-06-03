import 'package:dms/modules/todo_app/domain/entity/todo_entity_model.dart';

abstract class ToDoState {}

class TODoInitial extends ToDoState {}

class TODoBackstate extends ToDoState {}

class TODoEmptystate extends ToDoState {}

class TODOFailState extends ToDoState {}

class TODOLoadState extends ToDoState {}

class ToDoSuccessState extends ToDoState {
  ToDoAttributeModel toDoAttributeModel;
  ToDoSuccessState(this.toDoAttributeModel);
}

class ToDoTestState extends ToDoState {}

class TODOPostFailState extends ToDoState {}

class TODoPostInitial extends ToDoState {}

class ToDoPostSuccessState extends ToDoState {}

class ToDoHiveSuccessState extends ToDoState {
  ToDoAttributeModel res;
  ToDoHiveSuccessState(this.res);
}

class TODOHiveFailState extends ToDoState {}

class TODODeleteFailState extends ToDoState {}

class TODoDeleteInitial extends ToDoState {}

class ToDoDeleteSuccessState extends ToDoState {}

class TODOEditFailState extends ToDoState {}

class TODoEditInitial extends ToDoState {}

class ToDoEditSuccessState extends ToDoState {}

class ToDoSearchSuccessState extends ToDoState {}
