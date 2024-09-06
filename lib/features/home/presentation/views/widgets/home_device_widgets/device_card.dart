import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/helper/modals/build_finish_session_modal_bottom.dart';
import 'package:game_store/core/helper/modals/build_reserve_modal_bottom.dart';
import 'package:game_store/core/helper/device_type.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/custome_slideable.dart';
import 'package:gap/gap.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.device,
  });
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (device.status) {
          buildFinishSessionModalBottomSheet(context, deviceEntity: device);
        } else {
          buildReseveModalBottomSheet(
            context,
            device: device,
          );
        }
      },
      child: CustomSlidable(
        device: device,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: Theme.of(context).colorScheme.onBackground,
          ),
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
                    device.deviceName,
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "${device.priceHour} per hour",
                    style: Styles.textStyle12.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontFamily: "Robo",
                      fontWeight: FontWeight.bold,
                    ),
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
