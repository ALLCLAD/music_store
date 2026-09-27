import 'instrument_model.dart';

class CartItem {
  final Instrument instrument;
  int quantite;

  CartItem({required this.instrument, this.quantite = 1});
}