// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:game_store/features/home/domain/entities/device.dart';

abstract class DeviceState {}

class DeviceInitialState extends DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceFetchedSuccessfulState extends DeviceState {
  DeviceFetchedSuccessfulState({required this.deviceList});
  List<DeviceEntity> deviceList;
}

class DeviceFetchedFailureState extends DeviceState {
  DeviceFetchedFailureState({required this.errorMessage});
  String errorMessage;
}

class DeviceChangedSuccessfulState extends DeviceState {
  DeviceChangedSuccessfulState({required this.message});
  String message;
}

class DeviceChangedFailureState extends DeviceState {
  DeviceChangedFailureState({required this.message});
  String message;
}
