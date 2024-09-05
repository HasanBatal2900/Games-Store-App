import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource {
  List<DeviceEntity> getAllDevices();
  void addDevice(DeviceEntity deviceEntity);
  void deteleDevice(DeviceEntity deviceEntity,);
  void updateDeviceInfo(DeviceEntity newDeviceEntity, int index);
  // void changeDeviceStatus(bool newState, DeviceEntity deviceEntity);
}

class LocalDataSourceImp extends LocalDataSource {
  @override
  void addDevice(DeviceEntity deviceEntity) {
    Hive.box<DeviceEntity>(kDeviceKeyBox).add(deviceEntity);
  }

  @override
  void deteleDevice( DeviceEntity deviceEntity) {
    List<DeviceEntity> devices =
        Hive.box<DeviceEntity>(kDeviceKeyBox).values.toList();

int index=   devices.indexWhere((device) => device.serialId == deviceEntity.serialId);
    Hive.box<DeviceEntity>(kDeviceKeyBox).deleteAt(index);
  }

  @override
  List<DeviceEntity> getAllDevices() {
    var box = Hive.box<DeviceEntity>(kDeviceKeyBox);
    return box.values.toList();
  }

  @override
  void updateDeviceInfo(DeviceEntity newDeviceEntity, int index) {
    Hive.box<DeviceEntity>(kDeviceKeyBox).putAt(index, newDeviceEntity);
  }
}
