import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/instrument_model.dart';
import '../../providers/favoris_providers.dart';
import '../../providers/panier_providers.dart';
import '../../screens/product_detail_screen.dart';
import '../colors.dart';
import '../custom_snackbar.dart'; // Import de la SnackBar personnalisée

class FavoriteInstrumentCard extends ConsumerWidget {
  final Instrument instrument;

  const FavoriteInstrumentCard({
    super.key,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(instrument: instrument),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  instrument.imageUrl,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    width: 75,
                    height: 75,
                    child: Icon(Icons.broken_image, color: C5),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Informations produit
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instrument.nom,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      instrument.categorie.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: C1,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${instrument.prix} \$',
                        style: const TextStyle(
                          color: C3,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton : Ajouter au panier
              IconButton(
                icon: const Icon(Icons.add_shopping_cart, color: C2, size: 20),
                tooltip: 'Ajouter au panier',
                onPressed: () async {
                  await ref.read(panierProvider.notifier).ajouterArticle(instrument);

                  if (context.mounted) {
                    showCustomSnackBar(
                      context,
                      message: '${instrument.nom} ajouté au panier !',
                      icon: Icons.check_circle_outline,
                    );
                  }
                },
              ),

              // Bouton Supprimer des favoris
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded, color: C2, size: 24),
                tooltip: 'Retirer des favoris',
                onPressed: () async {
                  await ref.read(favorisProvider.notifier).retirerFavori(instrument);

                  if (context.mounted) {
                    showCustomSnackBar(
                      context,
                      message: '${instrument.nom} retiré des favoris',
                      icon: Icons.favorite_border,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}