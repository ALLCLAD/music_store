import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item_model.dart';
import '../models/instrument_model.dart';
import '../services/panier_db_service.dart';

// Service DB injecté via Riverpod
final panierDbServiceProvider = Provider<PanierDbService>((ref) {
  return PanierDbService();
});

// Provider AsyncNotifier
final panierProvider = AsyncNotifierProvider<PanierNotifier, List<CartItem>>(
  PanierNotifier.new,
);

class PanierNotifier extends AsyncNotifier<List<CartItem>> {
  late final PanierDbService _dbService;

  @override
  Future<List<CartItem>> build() async {
    _dbService = ref.watch(panierDbServiceProvider);
    return await _dbService.getPanier();
  }

  Future<void> ajouterArticle(Instrument instrument) async {
    await _dbService.ajouterOuIncrementer(instrument);
    // Recharge la liste mise à jour depuis la BDD sans afficher de loader gênant
    state = AsyncValue.data(await _dbService.getPanier());
  }

  Future<void> diminuerQuantite(Instrument instrument) async {
    await _dbService.decrementerOuRetirer(instrument.id);
    state = AsyncValue.data(await _dbService.getPanier());
  }

  Future<void> retirerDuPanier(Instrument instrument) async {
    await _dbService.supprimerDuPanier(instrument.id);
    state = AsyncValue.data(await _dbService.getPanier());
  }
}

// Providers utilitaires (calculs dérivés du panier)
final totalPanierProvider = Provider<double>((ref) {
  final asyncPanier = ref.watch(panierProvider);
  return asyncPanier.when(
    data: (cart) => cart.fold(
      0.0,
          (sum, item) => sum + (item.instrument.prix * item.quantite),
    ),
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
});

final nombreArticlesPanierProvider = Provider<int>((ref) {
  final asyncPanier = ref.watch(panierProvider);
  return asyncPanier.when(
    data: (cart) => cart.fold(0, (sum, item) => sum + item.quantite),
    loading: () => 0,
    error: (_, __) => 0,
  );
});