import 'package:flutter/material.dart';
import 'package:game_store/core/helper/device_type.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:gap/gap.dart';

class DeviceDropButton extends StatefulWidget {
  const DeviceDropButton({super.key, required this.onchanged});
  final Function(String) onchanged;
  @override
  State<DeviceDropButton> createState() => _DeviceDropButtonState();
}

String currentValue = "pc";
List<String> sumbitType = ["pc", "playStation", "xBox"];

class _DeviceDropButtonState extends State<DeviceDropButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "Device type",
          labelStyle: Styles.textStyle14.copyWith(
            color: Colors.black,
          ),
        ),
        value: currentValue,
        items: sumbitType
            .map(
              (type) => DropdownMenuItem(
                value: type,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getDeviceIconByName(type),
                    const Gap(10),
                    Text(type),
                  ],
                ),
              ),
            )
            .toList(),
        dropdownColor: Colors.white,
        alignment: Alignment.center,
        icon: Icon(
          Icons.arrow_drop_down_circle_rounded,
          color: Theme.of(context).colorScheme.onBackground,
          size: 30,
        ),
        onChanged: (value) {
          setState(() {
            currentValue = value!;
          });
          widget.onchanged(value!);
        },
      ),
    );
  }
}
