import 'package:hive/hive.dart';
part 'get_details_hive_model.g.dart';

@HiveType(typeId: 0)
class GetDetailsModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DataHive data;

  GetDetailsModel(
    this.id,
    this.name,
    this.data,
  );
}

@HiveType(typeId: 1)
class DataHive {
  @HiveField(0)
  final String dataColor;
  @HiveField(1)
  final String dataCapacity;
  @HiveField(2)
  final num capacityGb;
  @HiveField(3)
  final double dataPrice;
  @HiveField(4)
  final String dataGeneration;
  @HiveField(5)
  final num year;
  @HiveField(6)
  final String cpuModel;
  @HiveField(7)
  final String hardDiskSize;
  @HiveField(8)
  final String strapColour;
  @HiveField(9)
  final String caseSize;
  @HiveField(10)
  final String color;
  @HiveField(11)
  final String description;
  @HiveField(12)
  final String capacity;
  @HiveField(13)
  final double screenSize;
  @HiveField(14)
  final String generation;
  @HiveField(15)
  final String price;

  DataHive(
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
  );
}
