import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbController {

  static DbController? _instance;
  late Database _database;

  DbController._();

  factory DbController() {
    return _instance ??= DbController._();
  }

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, 'app_db.sql');

    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE users ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "firstName TEXT NOT NULL,"
            "lastName TEXT NOT NULL,"
            "email TEXT NOT NULL,"
            "phone TEXT NOT NULL,"
            "password TEXT NOT NULL"
            ")");
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }

  Database get database => _database;

}