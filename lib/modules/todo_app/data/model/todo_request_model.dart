class ItemRequestModel {
  String? title;
  String? description;
  bool? isCompleted;

  ItemRequestModel({
    this.title,
    this.description,
    this.isCompleted,
  });

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      ItemRequestModel(
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title ?? "",
        "description": description ?? "",
        "is_completed": (isCompleted ?? false).toString(),
      };
}
