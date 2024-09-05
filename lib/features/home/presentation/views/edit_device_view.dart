import 'package:flutter/material.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/edit_device_widgets/edit_device_body.dart';

class EditDeviceView extends StatelessWidget {
  const EditDeviceView({super.key,required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditDeviceViewBody(device:device),
    );
  }
}
