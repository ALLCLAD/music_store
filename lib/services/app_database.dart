import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // 1. Table Favoris
    await db.execute('''
      CREATE TABLE favoris(
        id INTEGER PRIMARY KEY,
        nom TEXT NOT NULL,
        description TEXT NOT NULL,
        prix REAL NOT NULL,
        categorie TEXT NOT NULL,
        imageUrl TEXT NOT NULL
      )
    ''');

    // 2. Table Panier
    await db.execute('''
      CREATE TABLE panier(
        instrument_id INTEGER PRIMARY KEY,
        nom TEXT NOT NULL,
        description TEXT NOT NULL,
        prix REAL NOT NULL,
        categorie TEXT NOT NULL,
        imageUrl TEXT NOT NULL,
        quantite INTEGER NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Gestion propre des migrations futures ici
  }

  Future<void> close() async {
    final db = await _database;
    if (db != null) {
      await db.close();
    }
  }
}