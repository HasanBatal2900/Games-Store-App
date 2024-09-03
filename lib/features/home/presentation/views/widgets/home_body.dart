import 'package:flutter/material.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/views/widgets/device_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Devices',
            style: Styles.textStyle24,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                child: Divider(
                  color: Colors.grey.shade300,
                ),
              ),
              itemCount: 10,
              itemBuilder: (context, index) => DeviceCard(
                device: DeviceEntity(
                  deviceName: "pc1",
                  priceHour: 5600,
                  type: "pc",
                  status: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
