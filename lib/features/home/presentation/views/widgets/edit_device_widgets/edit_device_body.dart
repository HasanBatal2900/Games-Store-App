import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/core/constants/padding.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/functions/play_audio_effect.dart';
import 'package:game_store/core/helper/modals/build_quick_alret.dart';
import 'package:game_store/core/utils/images_app.dart';
import 'package:game_store/core/utils/styles.dart';
import 'package:game_store/features/home/domain/entities/device.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_bloc.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_event.dart';
import 'package:game_store/features/home/presentation/blocs/home_bloc/device_state.dart';
import 'package:game_store/features/home/presentation/views/widgets/edit_device_widgets/edit_form.dart';
import 'package:game_store/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';

class EditDeviceViewBody extends StatelessWidget {
  const EditDeviceViewBody({super.key, required this.device});
  final DeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeviceBloc, DeviceState>(
      listener: (context, state) {
        if (state is DeviceChangedSuccessfulState) {
          GoRouter.of(context).pop();
          playAssetAudioEffect(audioPath: kScucessAudioPath);
          buildQuickAlret(context, QuickAlertType.success, state.message,
              S.of(context).editSuccessfulMessage);

          BlocProvider.of<DeviceBloc>(context).add(GetAllDeviceEvent());
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: kPadding.copyWith(top: 60),
          child: Column(
            children: [
              Center(
                child: Text(
                  S.of(context).editViewTitle,
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
      ),
    );
  }
}
