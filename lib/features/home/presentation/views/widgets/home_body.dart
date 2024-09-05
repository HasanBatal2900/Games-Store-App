import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';
import 'package:game_store/features/home/presentation/views/widgets/list_of_device.dart';
import 'package:hive/hive.dart';
import 'package:quickalert/models/quickalert_type.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  DeviceEntity de1 = DeviceEntity(
      deviceName: "deviceName", priceHour: 100, type: "type", status: false);
  late DeviceEntity de2;
  late AudioPlayer player;
  @override
  void dispose() {
    Hive.box<DeviceEntity>(kDeviceKeyBox).close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    de2 = de1.copyWith();
    log("de1 Serial :"+ de1.serialId.toString());
    log("de2 Serial :"+ de2.serialId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeviceBloc, DeviceState>(
      listener: (context, state) {
        if (state is DeviceChangedSuccessfulState) {
          // GoRouter.of(context).pop();
          player.play(AssetSource(kScucessAudioPath));
          buildQuickAlret(
            context,
            QuickAlertType.success,
            state.message,
            "Your order done successfuly",
          );
          BlocProvider.of<DeviceBloc>(context).add(GetAllDeviceEvent());
        }
      },
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Devices',
              style: Styles.textStyle24,
            ),
            const DeviceListView(),
          ],
        ),
      ),
    );
  }
}
