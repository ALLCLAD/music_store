class Instrument {
  final int id;
  final String nom;
  final String imageUrl;
  final double prix;
  final String categorie;
  final String description;
  bool estFavoris;

  Instrument({
    required this.id,
    required this.nom,
    required this.imageUrl,
    required this.prix,
    required this.categorie,
    required this.description,
    this.estFavoris = false,
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: json['id'] as int,
      nom: json['title'] as String,
      imageUrl: json['thumbnail'] as String,
      prix: (json['price'] as num).toDouble(),
      categorie: json['category'] as String,
      description: json['description'] as String ?? 'Aucune description disponible',
    );
  }
}