import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class AddDeviceUsecase {
  final HomRepo homRepo;

  AddDeviceUsecase({required this.homRepo});

  void call(DeviceEntity deviceEntity) {
      homRepo.addDevice(deviceEntity);
  }
}
