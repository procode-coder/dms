abstract class ToDoEvent {}

class ToDoInitialEvent extends ToDoEvent {}

class ToDoPostInitialEvent extends ToDoEvent {}

class ToDoDeleteInitialEvent extends ToDoEvent {
  String? uid;
  ToDoDeleteInitialEvent(this.uid);
}

class ToDOHiveInitialEvent extends ToDoEvent {}

class ToDoEditInitialEvent extends ToDoEvent {
  String? uid;
  ToDoEditInitialEvent(this.uid);
}

class SearchTasksEvent extends ToDoEvent {
  // String uid;

  // SearchTasksEvent(
  //   this.uid,
  // );
}
