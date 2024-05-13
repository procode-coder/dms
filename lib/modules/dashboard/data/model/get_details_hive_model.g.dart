// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_details_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetDetailsModelAdapter extends TypeAdapter<GetDetailsModel> {
  @override
  final int typeId = 0;

  @override
  GetDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetDetailsModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DataHive,
    );
  }

  @override
  void write(BinaryWriter writer, GetDetailsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataHiveAdapter extends TypeAdapter<DataHive> {
  @override
  final int typeId = 1;

  @override
  DataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataHive(
      fields[0] as String,
      fields[1] as String,
      fields[2] as num,
      fields[3] as double,
      fields[4] as String,
      fields[5] as num,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
      fields[13] as double,
      fields[14] as String,
      fields[15] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataHive obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.dataColor)
      ..writeByte(1)
      ..write(obj.dataCapacity)
      ..writeByte(2)
      ..write(obj.capacityGb)
      ..writeByte(3)
      ..write(obj.dataPrice)
      ..writeByte(4)
      ..write(obj.dataGeneration)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.cpuModel)
      ..writeByte(7)
      ..write(obj.hardDiskSize)
      ..writeByte(8)
      ..write(obj.strapColour)
      ..writeByte(9)
      ..write(obj.caseSize)
      ..writeByte(10)
      ..write(obj.color)
      ..writeByte(11)
      ..write(obj.description)
      ..writeByte(12)
      ..write(obj.capacity)
      ..writeByte(13)
      ..write(obj.screenSize)
      ..writeByte(14)
      ..write(obj.generation)
      ..writeByte(15)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
