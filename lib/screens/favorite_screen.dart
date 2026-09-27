import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/colors.dart';
import '../widgets/favoris/favoris_card.dart';
import '../providers/favoris_providers.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Écoute de l'AsyncValue des favoris
    final asyncFavoris = ref.watch(favorisProvider);

    return asyncFavoris.when(
      // 1. Succès : Données chargées depuis SQLite
      data: (listFavoris) {
        if (listFavoris.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite_border, size: 90, color: C2),
                SizedBox(height: 16),
                Text(
                  'Aucun instrument dans vos favoris.',
                  style: TextStyle(fontSize: 16, color: C2),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          itemCount: listFavoris.length,
          itemBuilder: (context, index) {
            return FavoriteInstrumentCard(instrument: listFavoris[index]);
          },
        );
      },

      // 2. Chargement initial rapide (Spinner minimaliste)
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: C2,
          strokeWidth: 2.5,
        ),
      ),

      // 3. Gestion d'erreur
      error: (error, stackTrace) => Center(
        child: Text(
          'Erreur lors de la lecture des favoris : $error',
          style: const TextStyle(color: C5),
        ),
      ),
    );
  }
}