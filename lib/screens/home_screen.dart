import 'package:e_instru/screens/favorite_screen.dart';
import 'package:e_instru/screens/panier_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_providers.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_app_bar.dart';
import 'catalog_screen.dart';

class HomePage extends ConsumerWidget {

  const HomePage({super.key});

  final List<Widget> _screens = const [
    CatalogPage(),
    FavoritesPage(),
    PanierPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentIndex = ref.watch(navigationIndexProvider);

    return Scaffold(

      appBar: const AppBarMs(),

      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: const BottomAppBarMs(),

    );
  }
}