import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class GetAllDeviceUsecase {
  final HomRepo homRepo;

  GetAllDeviceUsecase({required this.homRepo});

  List<DeviceEntity> call() {
    return homRepo.getAllDevices();
  }
}
