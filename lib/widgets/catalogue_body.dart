import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/instrument_provider.dart';
import '../widgets/instrument_card.dart';
import 'colors.dart';

class CatalogBody extends ConsumerWidget {
  const CatalogBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncInstruments = ref.watch(instrumentsProvider);

    return asyncInstruments.when(
      // 1. Succès : Affichage de la grille
      data: (mesInstruments) {
        if (mesInstruments.isEmpty) {
          return const Center(
            child: Text('Aucun produit disponible.'),
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
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),

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