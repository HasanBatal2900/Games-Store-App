import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:game_store/core/constants/borders.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/drop_button.dart';
import 'package:gap/gap.dart';

buildAddDeviceModalBottom(BuildContext context) {
  String devicetype="pc";
  String? deviceName;
  double priceHour = 0;
  GlobalKey<FormState> formkey = GlobalKey();
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Form(
        key: formkey,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * .5,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name Can't be empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      deviceName = value;
                    },
                    decoration: const InputDecoration(labelText: "Device Name"),
                  ),
                  const Gap(10),
                  DeviceDropButton(
                    onchanged: (type) {
                      devicetype = type;
                    },
                  ),
                  const Gap(10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Price Can't be empty";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      priceHour = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        suffixIcon: const Icon(
                          FontAwesomeIcons.solidCreditCard,
                          size: 18,
                        ),
                        labelText: "Hour price",
                        focusedBorder: kBorderOutlineStyle.copyWith(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        enabledBorder: kBorderOutlineStyle),
                  ),
                  const Gap(10),
                  SubmitButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<DeviceBloc>(context).add(
                          AddDeviceEvent(
                            deviceEntity: DeviceEntity(
                              deviceName: deviceName!,
                              type: devicetype,
                              priceHour: priceHour,
                              status: false,
                            ),
                          ),
                        );
                      }
                    },
                    title: "Save",
                    borderRadius: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
