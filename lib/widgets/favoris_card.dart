import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/instrument_model.dart';
import '../providers/favoris_providers.dart';
import '../providers/panier_providers.dart';
import '../widgets/colors.dart';


class FavoriteInstrumentCard extends ConsumerWidget {
  final Instrument instrument;

  const FavoriteInstrumentCard({
    super.key,
    required this.instrument
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Row(
          children: <Widget>[

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                instrument.imageUrl,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 75,
                  height: 75,
                  child: const Icon(
                    Icons.broken_image,
                    color: C5,
                  ),
                )
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    instrument.nom,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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

            IconButton(
              icon: const Icon(
                  Icons.add_shopping_cart,
                  color: C2,
                  size: 20
              ),

              tooltip: 'Ajouter au panier',

              onPressed: () {
                ref.read(panierProvider.notifier).ajouterArticle(instrument);

                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${instrument.nom} ajouté au panier !'),
                    duration: const Duration(seconds: 1),
                  ),
                );

              },
            ),

            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: C2, size: 24),

              onPressed: () {
                ref.read(favorisProvider.notifier).retirerFavori(instrument);
              },
            ),

          ],

        ),

      ),

    );
  }
}
