import 'package:dms/modules/todo_app/domain/entity/todo_entity_model.dart';

abstract class ToDoState {}

class TODoInitial extends ToDoState {}

class TODoBackstate extends ToDoState {}

class TODOFailState extends ToDoState {}

class ToDoSuccessState extends ToDoState {
  ToDoAttributeModel toDoAttributeModel;
  ToDoSuccessState(this.toDoAttributeModel);
}

class TODOPostFailState extends ToDoState {}

class TODoPostInitial extends ToDoState {}

class ToDoPostSuccessState extends ToDoState {}
