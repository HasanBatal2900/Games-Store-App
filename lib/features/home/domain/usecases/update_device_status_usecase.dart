import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class ChangeDeviceStatusUsecase {
  final HomRepo homRepo;

  ChangeDeviceStatusUsecase({required this.homRepo});

  Future<void> call(bool newState, DeviceEntity deviceEntity) async {
    await homRepo.changeDeviceStatus(newState, deviceEntity);
  }
}
