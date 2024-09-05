import 'package:game_store/features/home/domain/entities/device.dart';

abstract class DeviceEvent {}

class AddDeviceEvent extends DeviceEvent {
  AddDeviceEvent({required this.deviceEntity});
  final DeviceEntity deviceEntity;
}

class DeleteDeviceEvent extends DeviceEvent {
  DeleteDeviceEvent({required this.device});
  final DeviceEntity device;
}

class GetAllDeviceEvent extends DeviceEvent {}

class UpdateDeviceEvent extends DeviceEvent {
  UpdateDeviceEvent({required this.oldDevice, required this.newDevice});
  final DeviceEntity oldDevice;
  final DeviceEntity newDevice;
}
