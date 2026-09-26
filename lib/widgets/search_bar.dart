import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/instrument_provider.dart';
import 'colors.dart';

class SearchBarMs extends ConsumerWidget {
  const SearchBarMs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);

    return TextField(
      onChanged: (value) {
        // Met à jour la recherche dans l'état global
        ref.read(searchQueryProvider.notifier).state = value;
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: C2,
        ),
        // Bouton pour effacer la recherche si du texte est saisi
        suffixIcon: query.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.clear, color: C2, size: 20),
          onPressed: () {
            ref.read(searchQueryProvider.notifier).state = '';
          },
        )
            : null,
        hintText: 'Rechercher un instrument, une catégorie...',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: C2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: C1, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        filled: true,
        fillColor: C3,
      ),
    );
  }
}