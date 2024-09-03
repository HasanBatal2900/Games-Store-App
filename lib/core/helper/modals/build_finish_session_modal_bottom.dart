import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

buildFinishSessionModalBottomSheet(BuildContext context,
    {required String name, required TimeOfDay startingTime}) {
  // var nowTime = TimeOfDay.now();
  startingTime;
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
              initialValue: name,
              decoration: const InputDecoration(
                labelText: "User Name",
              ),
            ),
            TextFormField(
              readOnly: true,
              initialValue: "time",
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
