import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:video_downlad/providers/video.dart';

class DB {
  static Database? database;

  static Future<void> openDB() async {
    database = await openDatabase(join(await getDatabasesPath(), 'video.db'),
        onCreate: (db, version) {
      return db.execute("CREATE TABLE video (id INTEGER, time TEXT)");
    }, version: 1);
  }

  static Future<void> insert(Video vid) async {
    //Database db = await openDB();
    print(
        "===============================================================================");
    print("CREADO");
    print(
        "===============================================================================");

    List<Video> videos = await get();
    if (videos.length > 0 && videos[0].id == 1) {
      print("YA EXISTE");
      database!
          .rawUpdate('UPDATE video SET time = ? WHERE id = ?', [vid.time, '1']);

      return;
    }

    database!.insert('video', vid.toMap());
    print(
        "===============================================================================");
    print("GUARDADO");
    print(
        "===============================================================================");
  }

  static Future<List<Video>> get() async {
    //Database db = await openDB();
    final List<Map<String, dynamic>> videos = await database!.query('video');
    print(
        "===============================================================================");
    print("LEYENDO");
    print(videos);
    print(
        "===============================================================================");

    return List.generate(videos.length,
        (index) => Video(id: videos[index]['id'], time: videos[index]['time']));
  }

  static Future<bool> delete(String id) async {
    final int filas_borradas =
        await database!.rawDelete("DELETE FROM video WHERE id = ?", [id]);

    if (filas_borradas == 1) {
      return true;
    }

    return false;
  }
}
