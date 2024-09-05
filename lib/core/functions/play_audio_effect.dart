import 'package:audioplayers/audioplayers.dart';

playAssetAudioEffect({required String audioPath}) async {
  AudioPlayer audioPlayer = AudioPlayer();
  await audioPlayer.play(AssetSource(audioPath));
}