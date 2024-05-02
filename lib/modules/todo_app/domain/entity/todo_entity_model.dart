import 'package:equatable/equatable.dart';

class ToDoAttributeModel extends Equatable {
  final int? code;
  final bool? success;
  final int? timestamp;
  final String? message;
  final List<TodoAttributeItems>? items;
  final ToDoMetaItems? meta;

  const ToDoAttributeModel({
    required this.code,
    required this.success,
    required this.timestamp,
    required this.message,
    required this.items,
    required this.meta,
  });

  @override
  List<Object?> get props => [code, success, timestamp, message, items, meta];
}

class TodoAttributeItems extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoAttributeItems({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  List<Object?> get props =>
      [id, title, description, isCompleted, createdAt, updatedAt];
}

class ToDoMetaItems extends Equatable {
  final int totalItems;
  final int totalPages;
  final int perPageItem;
  final int currentPage;
  final int pageSize;
  final bool hasMorePage;

  const ToDoMetaItems({
    required this.totalItems,
    required this.totalPages,
    required this.perPageItem,
    required this.currentPage,
    required this.pageSize,
    required this.hasMorePage,
  });
  @override
  List<Object?> get props =>
      [totalItems, totalPages, perPageItem, currentPage, pageSize, hasMorePage];
}
