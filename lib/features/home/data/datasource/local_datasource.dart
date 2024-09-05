import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:hive/hive.dart';

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
    Hive.box<DeviceEntity>(kDeviceKeyBox).add(deviceEntity);
  }

  @override
  void changeDeviceStatus(bool newState, DeviceEntity deviceEntity) {
    int index = getIDevicendex(deviceEntity);

    DeviceEntity updatedDevice = DeviceEntity(
        deviceName: deviceEntity.deviceName,
        priceHour: deviceEntity.priceHour,
        type: deviceEntity.type,
        status: newState,
        userBeginTime: deviceEntity.userBeginTime,
        userName: deviceEntity.userName);
    Hive.box(kDeviceKeyBox).putAt(index, updatedDevice);
  }

  @override
  void deteleDevice(DeviceEntity deviceEntity) {
    List<DeviceEntity> devices =
        Hive.box<DeviceEntity>(kDeviceKeyBox).values.toList();

    devices.remove(deviceEntity);

    // Hive.box<DeviceEntity>(kDeviceKeyBox).put(kDeviceKeyBox,devices);
  }

  @override
  List<DeviceEntity> getAllDevices() {
    var box = Hive.box<DeviceEntity>(kDeviceKeyBox);
    return box.values.toList();
  }

  @override
  void updateDeviceInfo(DeviceEntity newDeviceEntity) {
    int index = getIDevicendex(newDeviceEntity);
    Hive.box<DeviceEntity>(kDeviceKeyBox).putAt(index, newDeviceEntity);
  }

  int getIDevicendex(DeviceEntity newDeviceEntity) {
    List<DeviceEntity> devices =
        Hive.box<DeviceEntity>(kDeviceKeyBox).values.toList();
    int index = devices
        .indexWhere((element) => element.serialId == newDeviceEntity.serialId);
    return index;
  }
}
