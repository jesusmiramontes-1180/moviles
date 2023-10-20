import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:video_downlad/providers/db.dart';
import 'package:video_downlad/providers/video.dart';
import 'package:video_player/video_player.dart';

class MyVideoProvider with ChangeNotifier {
  VideoPlayerController? _vCont;
  VideoPlayerController? get getVidCont => _vCont;
  bool isSaved = false;

  void initializeVideoPlayer(String filePath) async {
    // inicializar el video player
    _vCont = await VideoPlayerController.file(File(filePath))
      ..addListener(() => notifyListeners())
      ..setLooping(false)
      ..initialize().then((value) async {
        await loadConfigs();
      });
  }

  void isPlayOrPause(bool isPlay) {
    if (isPlay) {
      _vCont!.pause();
    } else {
      _vCont!.play();
    }
    notifyListeners();
  }

  Future<void> loadConfigs() async {
    List<Video> video_guardado = await DB.get();
    if (video_guardado.length > 0) {
      //Se recibio un dato guardado y se debe cargar
      print("Tiempo Recibido");
      print(video_guardado[0].time);

      List<String> partesPorDosPuntos = video_guardado[0].time.split(":");
      List<String> segundosYMilisegundos = partesPorDosPuntos.last.split(".");

      int hora = int.parse(partesPorDosPuntos[0]);
      int minuto = int.parse(partesPorDosPuntos[1]);
      int segundo = int.parse(segundosYMilisegundos[0]);
      int milisegundo = int.parse(segundosYMilisegundos[1]);

      _vCont!.seekTo(Duration(
        hours: hora,
        minutes: minuto,
        seconds: segundo,
        microseconds: milisegundo,
      ));
    }
  }

  Future saveConfigs() async {
    try {
      print(
          "===============================================================================");
      print("TIEMPO");
      print(getVidCont!.value.position);
      print(getVidCont!.value.position.runtimeType);
      print(
          "===============================================================================");
      DB.insert(Video(id: 1, time: getVidCont!.value.position.toString()));
      isSaved = true;
      notifyListeners();
    } catch (e) {
      print("Error al guardar: ${e.toString()}");
      isSaved = false;
      notifyListeners();
    }
  }
}
