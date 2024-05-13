// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoHiveModelAdapter extends TypeAdapter<ToDoHiveModel> {
  @override
  final int typeId = 0;

  @override
  ToDoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoHiveModel(
      code: fields[0] as int?,
      success: fields[1] as bool?,
      timestamp: fields[2] as int?,
      message: fields[3] as String?,
      items: (fields[4] as List?)?.cast<HiveItem>(),
      meta: fields[5] as HiveMeta?,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.timestamp)
      ..writeByte(3)
      ..write(obj.message)
      ..writeByte(4)
      ..write(obj.items)
      ..writeByte(5)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveItemAdapter extends TypeAdapter<HiveItem> {
  @override
  final int typeId = 1;

  @override
  HiveItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveItem(
      id: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      isCompleted: fields[3] as bool?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveMetaAdapter extends TypeAdapter<HiveMeta> {
  @override
  final int typeId = 2;

  @override
  HiveMeta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMeta(
      totalItems: fields[0] as int?,
      totalPages: fields[1] as int?,
      perPageItem: fields[2] as int?,
      currentPage: fields[3] as int?,
      pageSize: fields[4] as int?,
      hasMorePage: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMeta obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.totalItems)
      ..writeByte(1)
      ..write(obj.totalPages)
      ..writeByte(2)
      ..write(obj.perPageItem)
      ..writeByte(3)
      ..write(obj.currentPage)
      ..writeByte(4)
      ..write(obj.pageSize)
      ..writeByte(5)
      ..write(obj.hasMorePage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
