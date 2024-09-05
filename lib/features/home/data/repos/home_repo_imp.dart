import 'package:dartz/dartz.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/errors/failure.dart';
import 'package:game_store/features/home/data/datasource/local_datasource.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class HomeRepoImp extends HomRepo {
  final LocalDataSourceImp localDataSourceImp;
// final Remote in when you have an api to use some requst
  HomeRepoImp({required this.localDataSourceImp});
  @override
  Future<void> addDevice(DeviceEntity deviceEntity) async {
// if(internetOn)
//await remote.addDevice();
// Here you can use Either To checl whatever error or success
//
// else get for the local

    localDataSourceImp.addDevice(deviceEntity);
  }

  @override
  Future<void> changeDeviceStatus(bool newState, DeviceEntity deviceEntity) {
    // TODO: implement changeDeviceStatus
    throw UnimplementedError();
  }

  @override
  Future<void> deteleDevice(DeviceEntity deviceEntity) {
    // TODO: implement deteleDevice
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<DeviceEntity>>> getAllDevices() async {
    try {
      List<DeviceEntity> devices = localDataSourceImp.getAllDevices();
      return right(devices);
    } catch (e) {
      return left(
          EmptyLocalCacheFailure(errorMessage: kEmptyCacheErrorMessage));
    }
  }

  @override
  Future<void> updateDeviceInfo(DeviceEntity newDeviceEntity) {
    // TODO: implement updateDeviceInfo
    throw UnimplementedError();
  }
}
