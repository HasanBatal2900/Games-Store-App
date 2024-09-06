import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/functions/calcaute_total_hours.dart';
import 'package:game_store/core/functions/string_to_timeofday.dart';
import 'package:game_store/core/helper/modals/build_price_alret_dialog.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

buildFinishSessionModalBottomSheet(BuildContext context,
    {required DeviceEntity deviceEntity}) {
  var startTime = stringToTimeOfDay(time: deviceEntity.userBeginTime!);
  double totalhours = calcauteTotalHours(startTime);
  double totalPrice = calcuteTolalPrice(totalhours, deviceEntity.priceHour);
  log("Total hours is $totalhours");
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
            TextFormField(
              readOnly: true,
              initialValue: deviceEntity.userName,
              decoration: const InputDecoration(
                labelText: "User Name",
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: "$totalhours hours",
              decoration: const InputDecoration(
                labelText: "Spent Time",
              ),
            ),
            const Gap(20),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SubmitButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      title: "Cancel",
                      btnColor: Colors.red,
                      borderRadius: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: SubmitButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                        buildAlretPriceDialog(
                            context, deviceEntity.userName!, totalPrice);
                        BlocProvider.of<DeviceBloc>(context).add(
                          UpdateDeviceEvent(
                            oldDevice: deviceEntity,
                            newDevice: deviceEntity.copyWith(
                              status: false,
                              userBeginTime: null,
                              userName: null,
                            ),
                          ),
                        );
                      },
                      title: "Finish Session",
                      btnColor: Colors.green,
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
