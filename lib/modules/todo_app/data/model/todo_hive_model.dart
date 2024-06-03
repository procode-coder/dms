import 'package:hive/hive.dart';

part 'todo_hive_model.g.dart';

@HiveType(typeId: 0)
class ToDoHiveModel {
  @HiveField(0)
  int? code;
  @HiveField(1)
  bool? success;
  @HiveField(2)
  int? timestamp;
  @HiveField(3)
  String? message;
  @HiveField(4)
  List<HiveItem>? items;
  @HiveField(5)
  HiveMeta? meta;

  ToDoHiveModel({
    this.code,
    this.success,
    this.timestamp,
    this.message,
    this.items,
    this.meta,
  });
}

@HiveType(typeId: 1)
class HiveItem {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  bool? isCompleted;
  @HiveField(4)
  DateTime? createdAt;
  @HiveField(5)
  DateTime? updatedAt;

  HiveItem({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });
}

@HiveType(typeId: 2)
class HiveMeta {
  @HiveField(0)
  int? totalItems;
  @HiveField(1)
  int? totalPages;
  @HiveField(2)
  int? perPageItem;
  @HiveField(3)
  int? currentPage;
  @HiveField(4)
  int? pageSize;
  @HiveField(5)
  bool? hasMorePage;

  HiveMeta({
    this.totalItems,
    this.totalPages,
    this.perPageItem,
    this.currentPage,
    this.pageSize,
    this.hasMorePage,
  });
}
