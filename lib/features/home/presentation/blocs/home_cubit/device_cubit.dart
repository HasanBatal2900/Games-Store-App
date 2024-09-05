// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/features/home/domain/entities/device.dart';

import 'package:game_store/features/home/domain/usecases/add_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/delete_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/get_all_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/update_device_usecase.dart';
import 'package:game_store/features/home/presentation/blocs/home_cubit/device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final AddDeviceUsecase addDeviceUsecase;
  final DeleteDeviceUsecase deleteDeviceUsecase;
  final GetAllDeviceUsecase getAllDeviceUsecase;
  final UpdateDeviceUsecase updateDeviceUsecase;
  DeviceCubit(
    this.addDeviceUsecase,
    this.deleteDeviceUsecase,
    this.getAllDeviceUsecase,
    this.updateDeviceUsecase,
  ) : super(DeviceInitialState());

  void addDevice(DeviceEntity deviceEntity) {
    emit(DeviceLoadingState());
    addDeviceUsecase.call(deviceEntity);
    emit(DeviceChangedSuccessfulState(message: "Device Added Successfuly"));
  }

  void deleteDevice(int index) {
    emit(DeviceLoadingState());
    deleteDeviceUsecase.call(index);
    emit(DeviceChangedSuccessfulState(message: "Device Deleted Successfuly"));
  }

  void upadteDevice(DeviceEntity deviceEntity, int index) {
    emit(DeviceLoadingState());
    updateDeviceUsecase.call(deviceEntity, index);
    emit(DeviceChangedSuccessfulState(message: "Device Added Successfuly"));
  }

  void getAllDevice(DeviceEntity deviceEntity) {
    emit(DeviceLoadingState());
    List<DeviceEntity> deviceList = getAllDeviceUsecase.call();
    emit(DeviceFetchedSuccessfulState(deviceList: deviceList));
  }
}
