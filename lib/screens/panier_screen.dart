import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/colors.dart';
import '../widgets/panier_card.dart';
import '../providers/panier_providers.dart';

class PanierPage extends ConsumerWidget {
  const PanierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final listPanier = ref.watch(panierProvider);

    final total = ref.watch(panierProvider.notifier).totalPrix;

    if (listPanier.isEmpty) {
      return const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Icon(Icons.shopping_basket_outlined, size: 90, color: C2),

            SizedBox(height: 16),

            Text(
              'Votre panier est vide.',
              style: TextStyle(fontSize: 16)
            ),
          ]
        )

      );
    }

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

        decoration: BoxDecoration(
          color: C3,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, -2)
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
                  // Action de paiement
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

  }
}