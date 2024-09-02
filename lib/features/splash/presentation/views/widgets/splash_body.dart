import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_store/core/constants/strings.dart';
import 'package:game_store/core/utils/images_app.dart';
import 'package:game_store/router/app_router.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    initialAudio();
    playAudio();

    player.onPlayerComplete.listen((event) {
      GoRouter.of(context).push(AppRouter.kHomeViewRoute);
    });
  }

  Future<void> initialAudio() async {
    player = AudioPlayer();
    await player.setSource(AssetSource(kAudioPath));
  }

  Future<void> playAudio() async {
    await player.play(AssetSource(kAudioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageApp.logo,
            height: 150,
            fit: BoxFit.cover,
          )
              .animate()
              .scale(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn)
              .rotate(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 700)),
          const Gap(10),
          SizedBox(
            height: 70,
            width: 70,
            child: SpinKitRipple(
              color: Colors.deepPurple.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
