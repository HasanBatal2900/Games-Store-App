// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceEntityAdapter extends TypeAdapter<DeviceEntity> {
  @override
  final int typeId = 0;

  @override
  DeviceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceEntity(
      deviceName: fields[0] as String,
      priceHour: fields[2] as double,
      type: fields[3] as String,
      status: fields[4] as bool,
      userName: fields[5] as String?,
      userBeginTime: fields[6] as TimeOfDay?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.deviceName)
      ..writeByte(1)
      ..write(obj.serialId)
      ..writeByte(2)
      ..write(obj.priceHour)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.userBeginTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
