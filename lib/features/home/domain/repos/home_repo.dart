import 'package:game_store/features/home/domain/entities/device.dart';

abstract class HomRepo {
List<DeviceEntity> getAllDevices();
  void addDevice(DeviceEntity deviceEntity);
  void deteleDevice(DeviceEntity device);
  void updateDeviceInfo(DeviceEntity newDevice,DeviceEntity oldDevice);
}
