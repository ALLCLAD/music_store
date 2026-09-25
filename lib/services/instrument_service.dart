import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/instrument_model.dart';

class InstrumentService {

  static const String url = 'https://dummyjson.com/products';

  Future<List<Instrument>> fetchInstruments() async {

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> donnee = jsonDecode(response.body);

      final List<dynamic> productsJson = donnee['products'];

      return productsJson
          .map<Instrument>((json) => Instrument.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Erreur de chargement des données (${response.statusCode})');
    }
  }
}