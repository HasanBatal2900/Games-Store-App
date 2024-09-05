import 'package:bloc/bloc.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/domain/usecases/add_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/delete_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/get_all_device_usecase.dart';
import 'package:game_store/features/home/domain/usecases/update_device_usecase.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final AddDeviceUsecase addDeviceUsecase;
  final DeleteDeviceUsecase deleteDeviceUsecase;
  final GetAllDeviceUsecase getAllDeviceUsecase;
  final UpdateDeviceUsecase updateDeviceUsecase;
  DeviceBloc(
      {required this.addDeviceUsecase,
      required this.deleteDeviceUsecase,
      required this.getAllDeviceUsecase,
      required this.updateDeviceUsecase})
      : super(DeviceInitialState()) {
    on<DeviceEvent>((event, emit) {
      if (event is AddDeviceEvent) {
        emit(DeviceLoadingState());
        addDeviceUsecase.call(event.deviceEntity);
        emit(DeviceChangedSuccessfulState(message: kAddDeviceSucessMessage));
      } else if (event is DeleteDeviceEvent) {
        emit(DeviceLoadingState());
        deleteDeviceUsecase.call(event.device);
        emit(DeviceChangedSuccessfulState(message: kDeleteDeviceSucessMessage));
      } else if (event is GetAllDeviceEvent) {
        emit(DeviceLoadingState());
        List<DeviceEntity> deviceList = getAllDeviceUsecase.call();
        emit(DeviceFetchedSuccessfulState(deviceList: deviceList));
      } else if (event is UpdateDeviceEvent) {
        emit(DeviceLoadingState());
        updateDeviceUsecase.call(event.newDevice, event.oldDevice);
        emit(DeviceChangedSuccessfulState(message: kUpdateDeviceSucessMessage));
      }
    });
  }
}
