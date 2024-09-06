import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/functions/calcaute_total_hours.dart';
import 'package:game_store/core/functions/string_to_timeofday.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

buildFinishSessionModalBottomSheet(BuildContext context,
    {required DeviceEntity deviceEntity}) {
  var startTime = stringToTimeOfDay(time: deviceEntity.userBeginTime!);
  num totalhours = calcauteTotalHours(startTime);
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
              initialValue: "$totalhours",
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
                        buildQuickAlret(context, QuickAlertType.success,
                            "User has to pay : 5000\$ ", "Session Closed");
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
