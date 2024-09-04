import 'package:game_store/features/home/domain/entities/device.dart';

abstract class LocalDataSource {
  List<DeviceEntity> getAllDevices();
  void addDevice(DeviceEntity deviceEntity);
  void deteleDevice(DeviceEntity deviceEntity);
  void updateDeviceInfo(DeviceEntity newDeviceEntity);
  void changeDeviceStatus(bool newState, DeviceEntity deviceEntity);
}


class LocalDataSourceImp extends LocalDataSource {
  @override
  void addDevice(DeviceEntity deviceEntity) {
    // TODO: implement addDevice
  }

  @override
  void changeDeviceStatus(bool newState, DeviceEntity deviceEntity) {
    // TODO: implement changeDeviceStatus
  }

  @override
  void deteleDevice(DeviceEntity deviceEntity) {
    // TODO: implement deteleDevice
  }

  @override
  List<DeviceEntity> getAllDevices() {
    // TODO: implement getAllDevices
    throw UnimplementedError();
  }

  @override
  void updateDeviceInfo(DeviceEntity newDeviceEntity) {
    // TODO: implement updateDeviceInfo
  }
 
}