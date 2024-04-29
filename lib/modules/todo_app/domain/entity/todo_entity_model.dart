import 'package:equatable/equatable.dart';

class ToDoAttributeModel extends Equatable {
  final List<TodoAttributeItems>? todos;
  final int? total;
  final int? skip;
  final int? limit;

  const ToDoAttributeModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [skip, limit, todos, total];
}

class TodoAttributeItems extends Equatable {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  const TodoAttributeItems({
    required this.id,
    required this.userId,
    required this.completed,
    required this.todo,
  });
  @override
  List<Object?> get props => [id, todo, completed, userId];
}
