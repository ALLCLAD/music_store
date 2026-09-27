import 'package:sqflite/sqflite.dart';
import '../models/instrument_model.dart';
import '../models/cart_item_model.dart'; // Ou votre classe CartItem
import 'app_database.dart';

class PanierDbService {
  final AppDatabase _appDb = AppDatabase.instance;

  Future<List<CartItem>> getPanier() async {
    final db = await _appDb.database;
    final List<Map<String, dynamic>> maps = await db.query('panier');

    return maps.map((map) {
      return CartItem(
        instrument: Instrument.fromMap({
          'id': map['instrument_id'],
          'nom': map['nom'],
          'description': map['description'],
          'prix': map['prix'],
          'categorie': map['categorie'],
          'imageUrl': map['imageUrl'],
        }),
        quantite: map['quantite'] as int,
      );
    }).toList();
  }

  Future<void> ajouterOuIncrementer(Instrument instrument) async {
    final db = await _appDb.database;

    await db.rawInsert('''
      INSERT INTO panier (instrument_id, nom, description, prix, categorie, imageUrl, quantite)
      VALUES (?, ?, ?, ?, ?, ?, 1)
      ON CONFLICT(instrument_id) DO UPDATE SET quantite = quantite + 1
    ''', [
      instrument.id,
      instrument.nom,
      instrument.description,
      instrument.prix,
      instrument.categorie,
      instrument.imageUrl,
    ]);
  }

  Future<void> decrementerOuRetirer(int instrumentId) async {
    final db = await _appDb.database;
    final res = await db.query(
      'panier',
      columns: ['quantite'],
      where: 'instrument_id = ?',
      whereArgs: [instrumentId],
    );

    if (res.isNotEmpty) {
      int qte = res.first['quantite'] as int;
      if (qte > 1) {
        await db.update(
          'panier',
          {'quantite': qte - 1},
          where: 'instrument_id = ?',
          whereArgs: [instrumentId],
        );
      } else {
        await db.delete(
          'panier',
          where: 'instrument_id = ?',
          whereArgs: [instrumentId],
        );
      }
    }
  }

  Future<void> supprimerDuPanier(int instrumentId) async {
    final db = await _appDb.database;
    await db.delete(
      'panier',
      where: 'instrument_id = ?',
      whereArgs: [instrumentId],
    );
  }
}