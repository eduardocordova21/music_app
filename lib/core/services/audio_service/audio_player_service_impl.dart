import 'dart:developer';

import 'package:get/get.dart';
import 'package:music_app/core/services/audio_service/audio_player_service.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../errors/exceptions.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();
      return position?.inSeconds ?? 0;
    } catch (error, stackTrace) {
      const errorMessage = "Erro ao pegar a posição da música";
      log(errorMessage, error: error, stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.pause(), "Erro ao pausar a música");
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.play(AssetSource(audioAsset)),
        "Erro ao carregar a música");
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.resume(), "Erro ao continuar a música");
  }

  @override
  Future<void> seek(int seconds) {
    return callAudioPlayerServiceTryAndCatchFunction(() {
      final seekTo = Duration(seconds: seconds);
      return audioPlayer.seek(seekTo);
    }, "Erro ao trocar duração da música");
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.stop(), "Erro ao pausar a música");
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }

  Future<void> callAudioPlayerServiceTryAndCatchFunction(
      Future<void> Function() tryFunction,
      String audioPlayerExceptionMessage) async {
    try {
      await tryFunction();
    } catch (error, stackTrace) {
      final errorMessage = audioPlayerExceptionMessage;
      log(errorMessage, error: error, stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }
}
