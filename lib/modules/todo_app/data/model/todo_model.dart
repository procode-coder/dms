// To parse this JSON data, do
//
//     final toDoModel = toDoModelFromJson(jsonString);

import 'dart:convert';

ToDoModel toDoModelFromJson(String str) => ToDoModel.fromJson(json.decode(str));

String toDoModelToJson(ToDoModel data) => json.encode(data.toJson());

class ToDoModel {
  int? code;
  bool? success;
  int? timestamp;
  String? message;
  List<Item>? items;
  Meta? meta;

  ToDoModel({
    this.code,
    this.success,
    this.timestamp,
    this.message,
    this.items,
    this.meta,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        code: json["code"],
        success: json["success"],
        timestamp: json["timestamp"],
        message: json["message"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Item {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  Item({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "is_completed": isCompleted,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Meta {
  int? totalItems;
  int? totalPages;
  int? perPageItem;
  int? currentPage;
  int? pageSize;
  bool? hasMorePage;

  Meta({
    this.totalItems,
    this.totalPages,
    this.perPageItem,
    this.currentPage,
    this.pageSize,
    this.hasMorePage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
        perPageItem: json["per_page_item"],
        currentPage: json["current_page"],
        pageSize: json["page_size"],
        hasMorePage: json["has_more_page"],
      );

  Map<String, dynamic> toJson() => {
        "total_items": totalItems,
        "total_pages": totalPages,
        "per_page_item": perPageItem,
        "current_page": currentPage,
        "page_size": pageSize,
        "has_more_page": hasMorePage,
      };
}
