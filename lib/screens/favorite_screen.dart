import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/colors.dart';
import '../widgets/favoris_card.dart';
import '../providers/favoris_providers.dart';


class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listFavoris = ref.watch(favorisProvider);

    if (listFavoris.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(Icons.favorite_border, size: 90, color: C2),

            SizedBox(height: 16),

            Text(
              'Aucun instrument dans vos favoris.',
              style: TextStyle(
                fontSize: 16,
                color: C2
              )
            ),
        ]
      )
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      itemCount: listFavoris.length,
      itemBuilder: (context, index) {
        return FavoriteInstrumentCard(instrument: listFavoris[index]);
      },
    );
  }
}

