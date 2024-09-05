import 'package:game_store/features/home/data/datasource/local_datasource.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class HomeRepoImp extends HomRepo {
  final LocalDataSourceImp localDataSourceImp;

  HomeRepoImp({required this.localDataSourceImp});
  @override
  void addDevice(DeviceEntity deviceEntity) {
    localDataSourceImp.addDevice(deviceEntity);
  }

  @override
  void deteleDevice(int index) {
    localDataSourceImp.deteleDevice(index);
  }

  @override
  List<DeviceEntity> getAllDevices() {
    return localDataSourceImp.getAllDevices();
  }

  @override
  void updateDeviceInfo(DeviceEntity newDevice, int index) {
    localDataSourceImp.updateDeviceInfo(newDevice, index);
  }
}
