import 'package:sqflite/sqflite.dart';
import '../models/instrument_model.dart';
import 'app_database.dart';

class FavorisDbService {
  final AppDatabase _appDb = AppDatabase.instance;

  Future<void> insertFavori(Instrument instrument) async {
    final db = await _appDb.database;
    await db.insert(
      'favoris',
      instrument.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteFavori(int id) async {
    final db = await _appDb.database;
    await db.delete(
      'favoris',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Instrument>> getFavoris() async {
    final db = await _appDb.database;
    final List<Map<String, dynamic>> maps = await db.query('favoris');

    return List.generate(maps.length, (i) => Instrument.fromMap(maps[i]));
  }
}