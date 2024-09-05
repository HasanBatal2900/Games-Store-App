import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

buildReseveModalBottomSheet(BuildContext context,
    {required DeviceEntity device}) {
  String? userName;
  TimeOfDay? selectedTime;
  String? stringSelectedTime;
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
        height: MediaQuery.sizeOf(context).height * .3,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                userName = value;
              },
              decoration: const InputDecoration(
                labelText: "User Name",
                hintText: "Enter user Name",
              ),
            ),
            const Gap(20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ) ??
                          TimeOfDay.now();

                      stringSelectedTime = selectedTime.toString().substring(10,15);
                      log(stringSelectedTime!);
                    },
                    icon: Icon(
                      Icons.watch,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    label: Text(
                      "set Time",
                      style: Styles.textStyle18,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .4,
                    child: SubmitButton(
                      onPressed: () {
                        if (userName != null && stringSelectedTime != null) {
                          DeviceEntity newDevice = device.copyWith(
                              userName: userName, userBeginTime: stringSelectedTime!);
                          BlocProvider.of<DeviceBloc>(context).add(
                            UpdateDeviceEvent(
                                oldDevice: device, newDevice: newDevice),
                          );
                          GoRouter.of(context).pop();
                        }
                      },
                      title: "Save",
                      borderRadius: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
