import 'package:dms/modules/todo_app/data/model/todo_request_model.dart';

abstract class ToDoEvent {}

class ToDoInitialEvent extends ToDoEvent {}

class ToDoPostInitialEvent extends ToDoEvent {}
