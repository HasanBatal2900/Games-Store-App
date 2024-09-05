import 'package:flutter/material.dart';
import 'package:game_store/core/constants/borders.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/drop_button.dart';
import 'package:gap/gap.dart';

class EditDeviceForm extends StatelessWidget {
  const EditDeviceForm({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String? deviceName;
    String? deviceType;
    double? priceHour;
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null) {
                return "Can't be empty ";
              } else {
                return null;
              }
            },
            initialValue: device.deviceName,
            onChanged: (value) => deviceName = value,
            decoration: buildGeneralInputDecoration(context,
                label: "Edit DeviceName", hint: "Enter Device Name"),
          ),
          const Gap(20),
          TextFormField(
            validator: (value) {
              if (value == null) {
                return "Can't be empty ";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            initialValue: device.priceHour.toString(),
            onChanged: (value) {
              priceHour = double.parse(value);
            },
            decoration: buildGeneralInputDecoration(context,
                label: "Edit priceHour", hint: "Enter Price Hour"),
          ),
          DeviceDropButton(
            initialType: device.type,
            onchanged: (type) => deviceType = type,
          ),
          const Gap(20),
          SubmitButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                DeviceEntity newDevice = device.copyWith(
                    deviceName: deviceName!,
                    priceHour: priceHour!,
                    type: deviceType);
                // BlocProvider.of<DeviceBloc>(context).add(
                //     UpdateDeviceEvent(
                //         index: index, newDevice: newDevice));
              }
            },
            title: "Edit",
            borderRadius: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ],
      ),
    );
  }
}
