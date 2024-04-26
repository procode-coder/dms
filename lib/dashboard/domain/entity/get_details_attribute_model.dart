import 'package:equatable/equatable.dart';

class GetDetailsAttributeModel extends Equatable {
  final String? id;
  final String? name;
  final DataAttribute? data;

  const GetDetailsAttributeModel({
    required this.id,
    required this.name,
    required this.data,
  });

  @override
  List<Object?> get props => [id, name, data];
}

class DataAttribute extends Equatable {
  final String? dataColor;
  final String? dataCapacity;
  final num? capacityGb;
  final double? dataPrice;
  final String? dataGeneration;
  final num? year;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? strapColour;
  final String? caseSize;
  final String? color;
  final String? description;
  final String? capacity;
  final double? screenSize;
  final String? generation;
  final String? price;

  const DataAttribute({
    required this.dataColor,
    required this.dataCapacity,
    required this.capacityGb,
    required this.dataPrice,
    required this.dataGeneration,
    required this.year,
    required this.cpuModel,
    required this.hardDiskSize,
    required this.strapColour,
    required this.caseSize,
    required this.color,
    required this.description,
    required this.capacity,
    required this.screenSize,
    required this.generation,
    required this.price,
  });
  @override
  List<Object?> get props => [
        dataColor,
        dataCapacity,
        capacityGb,
        dataPrice,
        dataGeneration,
        year,
        cpuModel,
        hardDiskSize,
        strapColour,
        caseSize,
        color,
        description,
        capacity,
        screenSize,
        generation,
        price
      ];
}
