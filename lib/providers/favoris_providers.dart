import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/instrument_model.dart';
import '../services/favoris_db_service.dart';

final favorisDbServiceProvider = Provider<FavorisDbService>((ref) {
  return FavorisDbService();
});

final favorisProvider = AsyncNotifierProvider<FavorisNotifier, List<Instrument>>(
  FavorisNotifier.new,
);

class FavorisNotifier extends AsyncNotifier<List<Instrument>> {
  late final FavorisDbService _dbService;

  @override
  Future<List<Instrument>> build() async {
    _dbService = ref.watch(favorisDbServiceProvider);
    return await _dbService.getFavoris();
  }

  Future<void> toggleFavori(Instrument instrument) async {
    final actuels = state.value ?? [];
    final estFavori = actuels.any((item) => item.id == instrument.id);

    if (estFavori) {
      await _dbService.deleteFavori(instrument.id);
    } else {
      await _dbService.insertFavori(instrument);
    }

    state = AsyncValue.data(await _dbService.getFavoris());
  }

  Future<void> retirerFavori(Instrument instrument) async {
    await _dbService.deleteFavori(instrument.id);
    state = AsyncValue.data(await _dbService.getFavoris());
  }
}