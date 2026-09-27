import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/colors.dart';
import '../widgets/panier/panier_card.dart';
import '../providers/panier_providers.dart';

class PanierPage extends ConsumerWidget {
  const PanierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Écoute du provider asynchrone
    final asyncPanier = ref.watch(panierProvider);

    // 2. Écoute du provider dédié au calcul du total
    final total = ref.watch(totalPanierProvider);

    return asyncPanier.when(
      // --- ÉTAT 1 : Données chargées avec succès depuis SQLite ---
      data: (listPanier) {
        // Affichage si le panier est vide
        if (listPanier.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_basket_outlined, size: 90, color: C2),
                SizedBox(height: 16),
                Text(
                  'Votre panier est vide.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }

        // Affichage si le panier contient des articles
        return Scaffold(
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            itemCount: listPanier.length,
            itemBuilder: (context, index) {
              return PanierInstrumentCard(item: listPanier[index]);
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: C3,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, -2),
                )
              ],
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total', style: TextStyle(color: C2, fontSize: 12)),
                      Text(
                        '${total.toStringAsFixed(2)} \$',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: C1,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: C2,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Action de commande / paiement
                    },
                    icon: const Icon(Icons.payment, color: C3),
                    label: const Text(
                      'Commander',
                      style: TextStyle(color: C3, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

      // --- ÉTAT 2 : Chargement initial de la base de données ---
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: C2,
          strokeWidth: 2.5,
        ),
      ),

      // --- ÉTAT 3 : Gestion d'une éventuelle erreur SQLite ---
      error: (error, stackTrace) => Center(
        child: Text(
          'Erreur lors du chargement du panier : $error',
          style: const TextStyle(color: C5),
        ),
      ),
    );
  }
}