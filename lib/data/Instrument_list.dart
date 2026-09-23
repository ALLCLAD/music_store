import 'package:e_instru/models/instrument_model.dart';

final List<Instrument> mesInstruments = const [
  Instrument(
    id: 1,
    nom: 'Guitare Acoustique Yamaha',
    imageUrl: 'assets/images/guitare.jpg',
    prix: 150000.0,
    estFavoris: false,
  ),
  Instrument(
    id: 2,
    nom: 'Piano Numérique Roland',
    imageUrl: 'assets/images/piano.jpg',
    prix: 350000.0,
    estFavoris: true,
  ),
  Instrument(
    id: 3,
    nom: 'Batterie Électronique Alesis',
    imageUrl: 'assets/images/batterie.jpg',
    prix: 420000.0,
    estFavoris: true,
  ),
  Instrument(
    id: 4,
    nom: 'Saxophone Alto',
    imageUrl: 'assets/images/saxofone.jpg',
    prix: 280000.0,
    estFavoris: false,
  ),
];