import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyDownloadProvider with ChangeNotifier {
  bool isPermissionGranted = false;
  bool? isSavedSuccess;
  bool isLoading = false;
  String videoName = "butterfly";
  String? videoPath;
  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  Future<void> descargarVideo() async {
    try {
      isLoading = true;
      notifyListeners();
      var resp = await get(Uri.parse(videoUrl));
      if (resp.statusCode == 200) {
        await _saveFile(resp.bodyBytes);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      isSavedSuccess = false;
      print("Error al descargar archivo: ${e.toString()}");
      notifyListeners();
    }
  }

  Future<bool> _requestStoragePermission() async {
    var permiso = await Permission.storage.status;

    if (permiso == PermissionStatus.denied) {
      await Permission.storage.request();
    }

    return true; //permiso == PermissionStatus.granted;
  }

  Future<void> _saveFile(Uint8List _content) async {
    if (!await _requestStoragePermission()) {
      isLoading = false;
      isPermissionGranted = false;
      notifyListeners();
      return;
    }
    Directory? dir;
    if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      dir = await getApplicationDocumentsDirectory();
    } else {
      dir = await getApplicationSupportDirectory();
    }

    videoPath = "${dir!.path}/$videoName.mp4";
    File file = File(videoPath!);

    await file.writeAsBytes(_content);

    isSavedSuccess = true;
    isLoading = false;

    notifyListeners();
  }
}
