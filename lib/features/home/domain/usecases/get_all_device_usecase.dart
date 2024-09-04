import 'package:dartz/dartz.dart';
import 'package:game_store/core/errors/failure.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/repos/home_repo.dart';

class GetAllDeviceUsecase {
  final HomRepo homRepo;

  GetAllDeviceUsecase({required this.homRepo});

  Future<Either<Failure, List<DeviceEntity>>> call() {
    return homRepo.getAllDevices();
  }
}
