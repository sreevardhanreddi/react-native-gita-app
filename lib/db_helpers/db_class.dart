import 'package:gita_app/models/chapters_model.dart';
import 'package:gita_app/models/verses_model.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class GitaDb {
  static final String chaptersTable = 'gita_app_chapters';
  static final String versesTable = 'gita_app_verses';
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'gita.db'),
        onCreate: (db, version) {}, version: 1, onOpen: (db) {});
  }

  static Future<List<Chapter>> getChapters() async {
    final db = await GitaDb.database();
    final chaptersFromDb = await db.query(chaptersTable);
    List<Chapter> chapters = [];
    for (var item in chaptersFromDb) {
      chapters.add(Chapter.fromJson(item));
    }
    return chapters;
  }

  static Future<List<Verse>> getVersesFromChapter(int chapterNumber) async {
    final db = await GitaDb.database();
    final versesFromDb = await db.rawQuery(
        'SELECT * FROM $versesTable where chapter_number=$chapterNumber');
    List<Verse> verses = [];
    for (var item in versesFromDb) {
      verses.add(Verse.fromJson(item));
    }
    return verses;
  }
}
