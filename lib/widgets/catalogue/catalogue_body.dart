import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/instrument_provider.dart';
import 'instrument_card.dart';
import '../colors.dart';
import '../../widgets/catalogue/catalog_skeleton.dart';

class CatalogBody extends ConsumerWidget {
  const CatalogBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFilteredInstruments = ref.watch(filteredInstrumentsProvider);

    return asyncFilteredInstruments.when(
      // 1. Succès : Affichage des résultats filtrés
      data: (mesInstruments) {
        if (mesInstruments.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    Icons.search_off_rounded,
                    size: 50,
                    color: C2
                ),

                SizedBox(height: 10),
                Text(
                  'Aucun produit ne correspond à votre recherche.',

                  style: TextStyle(
                      color: C2,
                      fontSize: 15
                  ),

                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          itemCount: mesInstruments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            return InstrumentCard(instrument: mesInstruments[index]);
          },
        );
      },

      // 2. Chargement
      loading: () => const CatalogSkeleton(),

      // 3. Erreur
      error: (error, stackTrace) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Erreur : $error',
              textAlign: TextAlign.center,
              style: const TextStyle(color: C5),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => ref.refresh(instrumentsProvider),
              child: const Text('Réessayer'),
            ),
          ],
        ),
      ),
    );
  }
}