import 'package:game_store/features/home/domain/repos/home_repo.dart';

class DeleteDeviceUsecase {
  final HomRepo homRepo;

  DeleteDeviceUsecase({required this.homRepo});

  void call(int index) async {
    homRepo.deteleDevice(index);
  }
}
