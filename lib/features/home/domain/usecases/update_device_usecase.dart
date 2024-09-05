import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class UpdateDeviceUsecase {
  final HomRepo homRepo;

  UpdateDeviceUsecase({required this.homRepo});

 void call(DeviceEntity newDevice,DeviceEntity oldDevice)  {
     homRepo.updateDeviceInfo(newDevice, oldDevice);
  }
}
