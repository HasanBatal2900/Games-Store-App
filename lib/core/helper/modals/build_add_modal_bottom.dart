import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:game_store/core/constants/borders.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/widgets/submit_btn.dart';
import 'package:game_store/features/home/presentation/views/widgets/drop_button.dart';
import 'package:gap/gap.dart';

buildAddDeviceModalBottom(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "Device Name"),
                ),
                const Gap(10),
                DeviceDropButton(
                  onchanged: (p0) {},
                ),
                const Gap(10),
                TextField(
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
                  onPressed: () {},
                  title: "Save",
                  borderRadius: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
