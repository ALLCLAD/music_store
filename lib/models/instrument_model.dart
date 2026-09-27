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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'description': description,
      'prix': prix,
      'categorie': categorie,
      'imageUrl': imageUrl,
    };
  }

  factory Instrument.fromMap(Map<String, dynamic> map) {
    return Instrument(
      id: map['id'],
      nom: map['nom'],
      description: map['description'],
      prix: (map['prix'] as num).toDouble(),
      categorie: map['categorie'],
      imageUrl: map['imageUrl'],
    );
  }

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