import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/instrument_model.dart';

class CartItem {
  final Instrument instrument;
  int quantite;

  CartItem({required this.instrument, this.quantite = 1});
}

final panierProvider = NotifierProvider<PanierNotifier, List<CartItem>>(PanierNotifier.new);

class PanierNotifier extends Notifier<List<CartItem>> {
  @override
  List<CartItem> build() => [];

  void ajouterArticle(Instrument instrument) {
    final index = state.indexWhere((item) => item.instrument.id == instrument.id);
    if (index != -1) {
      final nouvelleListe = [...state];
      nouvelleListe[index].quantite++;
      state = nouvelleListe;
    } else {
      state = [...state, CartItem(instrument: instrument)];
    }
  }

  void diminuerQuantite(Instrument instrument) {
    final index = state.indexWhere((item) => item.instrument.id == instrument.id);
    if (index == -1) return;

    if (state[index].quantite > 1) {
      final nouvelleListe = [...state];
      nouvelleListe[index].quantite--;
      state = nouvelleListe;
    } else {
      retirerDuPanier(instrument);
    }
  }

  void retirerDuPanier(Instrument instrument) {
    state = state.where((item) => item.instrument.id != instrument.id).toList();
  }

  double get totalPrix {
    return state.fold(0.0, (sum, item) => sum + (item.instrument.prix * item.quantite));
  }
}