import 'package:game_store/features/home/domain/entities/device.dart';

abstract class DeviceEvent {}

class AddDeviceEvent extends DeviceEvent {
  AddDeviceEvent({required this.deviceEntity});
  final DeviceEntity deviceEntity;
}

class DeleteDeviceEvent extends DeviceEvent {
  DeleteDeviceEvent({required this.index});
  final int index;
}

class GetAllDeviceEvent extends DeviceEvent {}

class UpdateDeviceEvent extends DeviceEvent {
  UpdateDeviceEvent({required this.index, required this.newDevice});
  final int index;
  final DeviceEntity newDevice;
}
