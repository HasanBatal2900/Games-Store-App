import 'package:dartz/dartz.dart';
import 'package:game_store/core/errors/failure.dart';
import 'package:game_store/features/home/domain/entities/device.dart';

abstract class HomRepo {
  Future<Either<Failure,List<DeviceEntity>>> getAllDevices();
  Future<void> addDevice(DeviceEntity deviceEntity);
  // maybe change to get only the id of the device accroding to the hive package
  Future<void> deteleDevice(DeviceEntity deviceEntity);
  Future<void> updateDeviceInfo(DeviceEntity newDeviceEntity);
  Future<void> changeDeviceStatus(bool newState, DeviceEntity deviceEntity);
}
