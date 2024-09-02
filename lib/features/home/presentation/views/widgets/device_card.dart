import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_store/core/constants/colors.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/helper/device_type.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:gap/gap.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      closeOnScroll: true,
      dragStartBehavior: DragStartBehavior.down,
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 208, 207),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
              ),
            )),
        children: const [],
      ),
      startActionPane: ActionPane(
        extentRatio: 0.24,
        motion: Container(
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Icon(
            Icons.edit,
            color: Colors.amber,
          ),
        ),
        children: const [],
      ),
      direction: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal * .5),
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
              backgroundColor: device.status ? Colors.green : Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
