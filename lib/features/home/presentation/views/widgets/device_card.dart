import 'package:flutter/material.dart';
import 'package:game_store/core/constants/colors.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/helper/modals/build_finish_session_modal_bottom.dart';
import 'package:game_store/core/helper/modals/build_reserve_modal_bottom.dart';
import 'package:game_store/core/helper/device_type.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/custome_slideable.dart';
import 'package:gap/gap.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (device.status) {
          // build cancel reserve bottomsheet
          buildFinishSessionModalBottomSheet(context,
              name: "sobhi", startingTime: TimeOfDay.now());
        } else {
          // build  reserve bottomsheet
          buildReseveModalBottomSheet(
            context,
            onChanged: (text) {},
            onTimeSelected: (selectedTime) {},
          );
        }
      },
      child: CustomSlidable(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          color: Colors.white,
          margin:
              const EdgeInsets.symmetric(horizontal: kPaddingHorizontal * .5),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getDeviceIconByName(device.type),
              const Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    device.name,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "${device.priceHour} per hour",
                    style: Styles.textStyle12,
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius: 10,
                backgroundColor:
                    device.status ? Colors.green : Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
