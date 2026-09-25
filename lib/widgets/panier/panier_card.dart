import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/panier_providers.dart';
import '../colors.dart';

class PanierInstrumentCard extends ConsumerWidget {
  final CartItem item;

  const PanierInstrumentCard({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final prixTotalLigne = item.instrument.prix * item.quantite;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Row(

          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.instrument.imageUrl,
                width: 75,
                height: 75,
                fit: BoxFit.cover,

                errorBuilder: (context, error, stackTrace) => Container(
                  width: 75,
                  height: 75,
                  child: const Icon(
                      Icons.broken_image,
                      color: C5
                  ),

                ),

              ),

            ),

            const SizedBox(width: 12),

            Expanded(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    item.instrument.nom,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 2),

                  Text(
                    item.instrument.categorie.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${prixTotalLigne.toStringAsFixed(2)} \$',
                    style: const TextStyle(
                      color: C2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                ],

              ),

            ),

            Container(

              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Row(

                children: [

                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(6),
                    icon: const Icon(Icons.remove, size: 16, color: C1),
                    onPressed: () {
                      ref.read(panierProvider.notifier).diminuerQuantite(item.instrument);
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '${item.quantite}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(6),
                    icon: const Icon(Icons.add, size: 16, color: C1),
                    onPressed: () {
                      ref.read(panierProvider.notifier).ajouterArticle(item.instrument);
                    },
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