import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/utils/images_app.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/edit_device_widgets/edit_form.dart';
import 'package:gap/gap.dart';

class EditDeviceViewBody extends StatelessWidget {
  const EditDeviceViewBody({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kPadding.copyWith(top: 60),
        child: Column(
          children: [
            Center(
              child: Text(
                "Edit Device Info ",
                style: Styles.textStyle24.copyWith(
                  fontFamily: "Robo",
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            const Gap(15),
            Image.asset(ImageApp.edit,
                    height: MediaQuery.sizeOf(context).height * .4)
                .animate()
                .scale(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(
                    milliseconds: 600,
                  ),
                ),
            EditDeviceForm(device: device),
          ],
        ),
      ),
    );
  }
}
