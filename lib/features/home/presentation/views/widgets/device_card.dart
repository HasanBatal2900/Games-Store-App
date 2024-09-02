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
      dragStartBehavior: DragStartBehavior.start,
      endActionPane: const ActionPane(
        extentRatio: 0.25,
        motion: Icon(Icons.deblur),
        children: [],
      ),
      startActionPane: const ActionPane(
        extentRatio: 0.25,
        motion: Icon(Icons.deblur),
        children: [],
      ),
      direction: Axis.horizontal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey.shade400.withOpacity(0.5),
          ),
        ),
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
