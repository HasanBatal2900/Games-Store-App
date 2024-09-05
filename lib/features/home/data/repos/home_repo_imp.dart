import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/features/home/data/datasource/local_datasource.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';
import 'package:hive/hive.dart';

class HomeRepoImp extends HomRepo {
  final LocalDataSourceImp localDataSourceImp;
// final Remote in when you have an api to use some requst
  HomeRepoImp({required this.localDataSourceImp});
  @override
  void addDevice(DeviceEntity deviceEntity) {
// if(internetOn)
//await remote.addDevice();
// Here you can use Either To checl whatever error or success
//
// else get for the local

    localDataSourceImp.addDevice(deviceEntity);
  }

  // @override
  // void changeDeviceStatus(bool newState, DeviceEntity newDevice, int index) {
  //   // TODO: implement changeDeviceStatus
  //   throw UnimplementedError();
  // }

  @override
  void deteleDevice(int index) {
    Hive.box<DeviceEntity>(kDeviceKeyBox).deleteAt(index);
  }

  @override
  List<DeviceEntity> getAllDevices() {
    List<DeviceEntity> deviceList =
        Hive.box<DeviceEntity>(kDeviceKeyBox).values.toList();

    return deviceList;
  }

  @override
  void updateDeviceInfo(DeviceEntity newDevice, int index) {
    Hive.box<DeviceEntity>(kDeviceKeyBox).putAt(index, newDevice);
  }
}
