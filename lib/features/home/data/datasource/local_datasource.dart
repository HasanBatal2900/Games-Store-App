import 'package:game_store/core/constants/keys.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource {
  List<DeviceEntity> getAllDevices();
  void addDevice(DeviceEntity deviceEntity);
  void deteleDevice(DeviceEntity deviceEntity,);
  void updateDeviceInfo(DeviceEntity newDeviceEntity, DeviceEntity oldDevice);
  // void changeDeviceStatus(bool newState, DeviceEntity deviceEntity);
}

class LocalDataSourceImp extends LocalDataSource {
  @override
  void addDevice(DeviceEntity deviceEntity) {
    Hive.box<DeviceEntity>(kDeviceKeyBox).add(deviceEntity);
  }

  @override
  void deteleDevice( DeviceEntity deviceEntity) {
    int index = getDeviceIndex(deviceEntity);
    Hive.box<DeviceEntity>(kDeviceKeyBox).deleteAt(index);
  }

  int getDeviceIndex(DeviceEntity deviceEntity) {
    List<DeviceEntity> devices =
        Hive.box<DeviceEntity>(kDeviceKeyBox).values.toList();
    
    int index=   devices.indexWhere((device) => device.serialId == deviceEntity.serialId);
    return index;
  }

  @override
  List<DeviceEntity> getAllDevices() {
    var box = Hive.box<DeviceEntity>(kDeviceKeyBox);
    return box.values.toList();
  }

  @override
  void updateDeviceInfo(DeviceEntity newDeviceEntity, DeviceEntity oldDevice) {
    int index =getDeviceIndex(oldDevice);
    Hive.box<DeviceEntity>(kDeviceKeyBox).putAt(index, newDeviceEntity);

  }
}
