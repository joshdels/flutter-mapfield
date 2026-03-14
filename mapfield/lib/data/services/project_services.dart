import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/project_models.dart';
import '../models/gis_layer_models.dart';

class DatabaseService {
  DatabaseService._internal();
  static final DatabaseService _instance = DatabaseService._internal();
  static DatabaseService get instance => _instance;
  static Database? _database;

  final String _projectsTable = 'projects';
  final String _gisLayersTable = 'gis_layers';

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final directory = await getApplicationSupportDirectory();
      path = join(directory.path, 'my_app_database_v2.db');
    } else {
      path = join(await getDatabasesPath(), 'my_app_database.db');
    }

    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_projectsTable  (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        selectedBasemap TEXT,
        tileUrl TEXT,
        createdAt TEXT NOT NULL,
        createdBy TEXT,
        lastOpened TEXT,
        fields TEXT,
        zoomLevel REAL,
        centerLatitude REAL,
        centerLongitude REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE $_gisLayersTable (
        id TEXT PRIMIRY KEY,
        projectId TEXT NOT NULL,
        name TEXT NOT NULL,
        type TEXT,
        path TEXT,
        createdAt Text,
        FOREIGN KEY(projectId) REFERENCES projects(id) ON DELETE CASCADE  
      )
      ''');
  }

  // --- CRUD Operations ---

  Future<int> insertProject(ProjectModel project) async {
    final db = await database;
    return await db.insert(
      _projectsTable,
      project.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProjectModel>> getAllProjects() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _projectsTable,
      orderBy: 'lastOpened DESC',
    );
    return maps.map((map) => ProjectModel.fromJson(map)).toList();
  }

  Future<int> updateProject(ProjectModel project) async {
    final db = await database;
    return await db.update(
      _projectsTable,
      project.toJson(),
      where: 'id = ?',
      whereArgs: [project.id],
    );
  }

  Future<int> deleteProject(String id) async {
    final db = await database;
    return await db.delete(_projectsTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> checkDatabaseStorage() async {
    final db = await database;
    var tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name='$_projectsTable '",
    );
    print('Table check: $tables');

    var count = await db.rawQuery('SELECT COUNT(*) FROM $_projectsTable ');
    print('Row count in $_projectsTable : ${count.first['COUNT(*)']}');
  }

  // GIS CRUD

  Future<int> insertGisLayer(GISLayerModel layer) async {
    final db = await database;
    return await db.insert(
      _gisLayersTable,
      layer.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<GISLayerModel>> getGisLayers(String projectId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _gisLayersTable,
      where: 'projectId = ?',
      whereArgs: [projectId],
    );
    return maps.map((map) => GISLayerModel.fromJson(map)).toList();
  }

  Future<int> updateGisLayer(GISLayerModel layer) async {
    final db = await database;
    return await db.update(
      _gisLayersTable,
      layer.toJson(),
      where: 'id = ?',
      whereArgs: [layer.id],
    );
  }

  Future<int> deleteGisLayer(String id) async {
    final db = await database;
    return await db.delete(_gisLayersTable, where: 'id = ?', whereArgs: [id]);
  }
}
