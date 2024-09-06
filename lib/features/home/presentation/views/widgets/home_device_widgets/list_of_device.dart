import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/device_card.dart';
import 'package:gap/gap.dart';

class DeviceListView extends StatelessWidget {
  const DeviceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          if (state is DeviceFetchedSuccessfulState) {
            List<DeviceEntity> devices = state.deviceList;
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Gap(15),
              itemCount: devices.length,
              itemBuilder: (context, index) => DeviceCard(
                device: devices[index],
              ),
            );
          } else if (state is DeviceFetchedFailureState) {
            return Center(
              child: Text(
                kGetAllDeviceFailureMessage,
                style: Styles.textStyle24.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
