import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/project_models.dart';

class DatabaseService {
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();
  static DatabaseService get instance => _instance;

  static Database? _database;
  final String _tableName = 'projects';

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final directory = await getApplicationSupportDirectory();
      path = join(directory.path, 'my_app_database.db');
    } else {
      path = join(await getDatabasesPath(), 'my_app_database.db');
    }

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        selectedBasemap TEXT,
        createdAt TEXT NOT NULL,
        createdBy TEXT,
        lastOpened TEXT,
        fields TEXT,
        zoomLevel REAL,
        centerLatitude REAL,
        centerLongitude REAL
      )
    ''');
  }

  // --- CRUD Operations ---

  Future<int> insertProject(ProjectModel project) async {
    final db = await database;
    return await db.insert(
      _tableName,
      project.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProjectModel>> getAllProjects() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
      orderBy: 'lastOpened DESC',
    );
    return maps.map((map) => ProjectModel.fromJson(map)).toList();
  }

  Future<int> updateProject(ProjectModel project) async {
    final db = await database;
    return await db.update(
      _tableName,
      project.toJson(),
      where: 'id = ?',
      whereArgs: [project.id],
    );
  }

  Future<int> deleteProject(String id) async {
    final db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> checkDatabaseStorage() async {
    final db = await database;
    var tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$_tableName'",
    );
    print('Table check: $tables');

    var count = await db.rawQuery('SELECT COUNT(*) FROM $_tableName');
    print('Row count in $_tableName: ${count.first['COUNT(*)']}');
  }
}
