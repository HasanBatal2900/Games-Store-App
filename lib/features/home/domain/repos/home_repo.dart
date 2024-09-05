import 'package:game_store/features/home/domain/entities/device.dart';

abstract class HomRepo {
List<DeviceEntity> getAllDevices();
  void addDevice(DeviceEntity deviceEntity);
  // maybe change to get only the id of the device accroding to the hive package
  void deteleDevice(int index);
  void updateDeviceInfo(DeviceEntity newDevice,int index );
  // void changeDeviceStatus(bool newState, DeviceEntity newDevice,int index);
}
