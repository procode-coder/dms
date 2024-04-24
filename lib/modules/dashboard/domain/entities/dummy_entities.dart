import 'package:equatable/equatable.dart';

class DummyAttributesItems extends Equatable {
  final String? id;
  final String? name;
  final DataAttributeModel? data;

  const DummyAttributesItems({
    this.id,
    this.name,
    this.data,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        data,
      ];
}

class DataAttributeModel extends Equatable {
  final String? dataColor;
  final String? dataCapacity;
  final int? capacityGb;
  final double? dataPrice;
  final String? dataGeneration;
  final int? year;
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

  const DataAttributeModel({
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
        price,
      ];
}
