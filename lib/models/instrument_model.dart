class Instrument {
  final int id;
  final String nom;
  final String imageUrl;
  final double prix;
  final bool estFavoris;

  const Instrument({
    required this.id,
    required this.nom,
    required this.imageUrl,
    required this.prix,
    this.estFavoris =false,
  });
}