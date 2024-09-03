import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:gap/gap.dart';

buildReseveModalBottomSheet(BuildContext context,
    {required Function(String text) onChanged,
    required Function(TimeOfDay selectedTime) onTimeSelected}) {
  // return the time
  TimeOfDay selectedTime;
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
              onChanged: onChanged,
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
                      onTimeSelected(selectedTime);
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
                        onPressed: () {},
                        title: "Save",
                        borderRadius: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
