import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/instrument_model.dart';
import '../services/instrument_service.dart';

final instrumentServiceProvider = Provider<InstrumentService>((ref) {
  return InstrumentService();
});

// 1. Provider brute qui récupère tous les instruments
final instrumentsProvider = FutureProvider<List<Instrument>>((ref) async {
  final service = ref.watch(instrumentServiceProvider);
  return service.fetchInstruments();
});

// 2. Provider de la chaîne de recherche (StateProvider)
final searchQueryProvider = StateProvider<String>((ref) => '');

// 3. Provider filtré réactif (Combine la liste brute + la recherche)
final filteredInstrumentsProvider = Provider<AsyncValue<List<Instrument>>>((ref) {
  final query = ref.watch(searchQueryProvider).trim().toLowerCase();
  final asyncInstruments = ref.watch(instrumentsProvider);

  // transformAsync/whenData conserve les états loading et error automatiquement
  return asyncInstruments.whenData((list) {
    if (query.isEmpty) {
      return list;
    }
    return list.where((instrument) {
      final nomMatches = instrument.nom.toLowerCase().contains(query);
      final categorieMatches = instrument.categorie.toLowerCase().contains(query);
      return nomMatches || categorieMatches;
    }).toList();
  });
});