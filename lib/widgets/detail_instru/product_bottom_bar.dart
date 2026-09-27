import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/instrument_model.dart';
import '../../providers/favoris_providers.dart';
import '../../providers/panier_providers.dart';
import '../colors.dart';
import '../custom_snackbar.dart'; // Import de la SnackBar réutilisable

class ProductBottomBar extends ConsumerWidget {
  final Instrument instrument;

  const ProductBottomBar({
    super.key,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFavoris = ref.watch(favorisProvider);
    final estFavoris = asyncFavoris.value?.any((item) => item.id == instrument.id) ?? false;

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
              onTap: () async {
                final precedent = estFavoris;
                await ref.read(favorisProvider.notifier).toggleFavori(instrument);

                if (context.mounted) {
                  showCustomSnackBar(
                    context,
                    message: precedent
                        ? '${instrument.nom} retiré des favoris'
                        : '${instrument.nom} ajouté aux favoris !',
                    icon: precedent ? Icons.favorite_border : Icons.favorite,
                  );
                }
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

                    showCustomSnackBar(
                      context,
                      message: '${instrument.nom} ajouté au panier !',
                      icon: Icons.check_circle_outline,
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