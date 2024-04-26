import 'dart:convert';

List<GetDetailsResponseModel> getDetailsResponseModelFromJson(String str) =>
    List<GetDetailsResponseModel>.from(
        json.decode(str).map((x) => GetDetailsResponseModel.fromJson(x)));

String getDetailsResponseModelToJson(List<GetDetailsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDetailsResponseModel {
  String? id;
  String? name;
  Data? data;

  GetDetailsResponseModel({
    this.id,
    this.name,
    this.data,
  });

  factory GetDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDetailsResponseModel(
        id: json["id"],
        name: json["name"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "data": data?.toJson(),
      };
}

class Data {
  String? dataColor;
  String? dataCapacity;
  num? capacityGb;
  double? dataPrice;
  String? dataGeneration;
  num? year;
  String? cpuModel;
  String? hardDiskSize;
  String? strapColour;
  String? caseSize;
  String? color;
  String? description;
  String? capacity;
  double? screenSize;
  String? generation;
  String? price;

  Data({
    this.dataColor,
    this.dataCapacity,
    this.capacityGb,
    this.dataPrice,
    this.dataGeneration,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.color,
    this.description,
    this.capacity,
    this.screenSize,
    this.generation,
    this.price,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataColor: json["color"],
        dataCapacity: json["capacity"],
        capacityGb: json["capacity GB"],
        dataPrice: json["price"]?.toDouble(),
        dataGeneration: json["generation"],
        year: json["year"],
        cpuModel: json["CPU model"],
        hardDiskSize: json["Hard disk size"],
        strapColour: json["Strap Colour"],
        caseSize: json["Case Size"],
        color: json["Color"],
        description: json["Description"],
        capacity: json["Capacity"],
        screenSize: json["Screen size"]?.toDouble(),
        generation: json["Generation"],
        price: json["Price"],
      );

  Map<String, dynamic> toJson() => {
        "color": dataColor,
        "capacity": dataCapacity,
        "capacity GB": capacityGb,
        "price": dataPrice,
        "generation": dataGeneration,
        "year": year,
        "CPU model": cpuModel,
        "Hard disk size": hardDiskSize,
        "Strap Colour": strapColour,
        "Case Size": caseSize,
        "Color": color,
        "Description": description,
        "Capacity": capacity,
        "Screen size": screenSize,
        "Generation": generation,
        "Price": price,
      };
}
