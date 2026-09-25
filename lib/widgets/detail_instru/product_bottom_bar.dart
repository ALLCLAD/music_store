import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/instrument_model.dart';
import '../../providers/favoris_providers.dart';
import '../../providers/panier_providers.dart';
import '../colors.dart';

class ProductBottomBar extends ConsumerWidget {
  final Instrument instrument;

  const ProductBottomBar({
    super.key,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estFavoris = ref
        .watch(favorisProvider)
        .any((item) => item.id == instrument.id);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Bouton Favori
            InkWell(
              onTap: () {
                ref.read(favorisProvider.notifier).toggleFavori(instrument);
              },
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: estFavoris ? C5.withOpacity(0.12) : C3,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: estFavoris ? C5 : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  estFavoris ? Icons.favorite : Icons.favorite_border,
                  color: estFavoris ? C5 : C2,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Bouton Panier
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: C2,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
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
                  icon: const Icon(Icons.add_shopping_cart_rounded, color: C3, size: 20),
                  label: const Text(
                    'Ajouter au panier',
                    style: TextStyle(
                      color: C3,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}