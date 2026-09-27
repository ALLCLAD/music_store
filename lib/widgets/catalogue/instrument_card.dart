import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/instrument_model.dart';
import '../../providers/favoris_providers.dart';
import '../../providers/panier_providers.dart';
import '../../screens/product_detail_screen.dart';
import '../colors.dart';
import '../custom_snackbar.dart'; // Import de la SnackBar réutilisable

class InstrumentCard extends ConsumerWidget {
  final Instrument instrument;

  const InstrumentCard({
    super.key,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Optimisation : Seule la carte impactée par le changement se reconstruira
    final estFavoris = ref.watch(
      favorisProvider.select(
            (asyncData) =>
        asyncData.value?.any((item) => item.id == instrument.id) ?? false,
      ),
    );

    return Card(
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(instrument: instrument),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image
            Expanded(
              child: Image.network(
                width: double.infinity,
                instrument.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: C5,
                    size: 40,
                  ),
                ),
              ),
            ),

            // Nom + Bouton Favoris
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 2.0, top: 4.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      instrument.nom,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Bouton favoris
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(4),
                    onPressed: () async {
                      final precedent = estFavoris;
                      await ref
                          .read(favorisProvider.notifier)
                          .toggleFavori(instrument);

                      if (context.mounted) {
                        final message = precedent
                            ? '${instrument.nom} retiré des favoris'
                            : '${instrument.nom} ajouté aux favoris !';

                        showCustomSnackBar(
                          context,
                          message: message,
                          icon: precedent
                              ? Icons.favorite_border
                              : Icons.favorite,
                        );
                      }
                    },
                    icon: Icon(
                      estFavoris ? Icons.favorite : Icons.favorite_border,
                      color: C5,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Prix + Bouton Ajout Panier
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 8.0, top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        instrument.categorie.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          color: C5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        decoration: BoxDecoration(
                          color: C1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Text(
                          '${instrument.prix} \$',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: C3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: C2,
                      padding: const EdgeInsets.all(6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      ref
                          .read(panierProvider.notifier)
                          .ajouterArticle(instrument);

                      showCustomSnackBar(
                        context,
                        message: '${instrument.nom} ajouté au panier !',
                        icon: Icons.check_circle_outline,
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart,
                        color: C3, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}