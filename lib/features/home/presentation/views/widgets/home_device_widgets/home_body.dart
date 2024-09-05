import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/functions/play_audio_effect.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/list_of_device.dart';
import 'package:quickalert/models/quickalert_type.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
// TimeOfDay _startTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));

    return BlocListener<DeviceBloc, DeviceState>(
      listener: (context, state) {
        if (state is DeviceChangedSuccessfulState) {
          playAssetAudioEffect(audioPath: kScucessAudioPath);
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
