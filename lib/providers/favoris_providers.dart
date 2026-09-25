import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/instrument_model.dart';

final favorisProvider = NotifierProvider<FavorisNotifier, List<Instrument>>(FavorisNotifier.new);

class FavorisNotifier extends Notifier<List<Instrument>> {
  @override
  List<Instrument> build() => [];

  void toggleFavori(Instrument instrument) {
    final existe = state.any((item) => item.id == instrument.id);
    if (existe) {
      state = state.where((item) => item.id != instrument.id).toList();
    } else {
      state = [...state, instrument];
    }
  }

  void retirerFavori(Instrument instrument) {
    state = state.where((item) => item.id != instrument.id).toList();
  }
}