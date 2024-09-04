import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class DeleteDeviceUsecase {
  final HomRepo homRepo;

  DeleteDeviceUsecase({required this.homRepo});

  Future<void> call(DeviceEntity deviceEntity) async{
     await homRepo.deteleDevice(deviceEntity);
  }
}
