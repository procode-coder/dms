class ItemRequestModel {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  ItemRequestModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      ItemRequestModel(
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
        "_id": id ?? "",
        "title": title ?? "",
        "description": description ?? "",
        "is_completed": (isCompleted ?? false).toString(),
        "created_at":
            createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
        "updated_at":
            updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      };
}
