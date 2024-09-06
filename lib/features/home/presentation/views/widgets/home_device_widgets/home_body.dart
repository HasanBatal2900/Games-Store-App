import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/functions/play_audio_effect.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/core/widgets/open_drawer_btn.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';
import 'package:game_store/features/home/presentation/views/widgets/home_device_widgets/list_of_device.dart';
import 'package:game_store/generated/l10n.dart';
import 'package:quickalert/models/quickalert_type.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeviceBloc, DeviceState>(
      listener: (context, state) {
        if (state is DeviceChangedSuccessfulState) {
          playAssetAudioEffect(audioPath: kScucessAudioPath);
          buildQuickAlret(
            context,
            QuickAlertType.success,
            state.message,
            S.of(context).generalSuccessMessage,
          );
          BlocProvider.of<DeviceBloc>(context).add(GetAllDeviceEvent());
        }
      },
      child: Padding(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).homeTitle,
                  style: Styles.textStyle24.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const OpenDrawerButton(),
              ],
            ),
            const DeviceListView(),
          ],
        ),
      ),
    );
  }
}
