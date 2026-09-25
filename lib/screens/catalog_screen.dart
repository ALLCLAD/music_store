import 'package:flutter/material.dart';
import '../widgets/colors.dart';
import '../widgets/search_bar.dart';
import '../widgets/catalogue_body.dart';


class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(8),

          child: Column(
            children: <Widget>[

              const SearchBarMs(),

              const SizedBox(height: 12),

              Expanded(

                child: CatalogBody(),

              ),

            ],
          ),
        ),

      ),

      floatingActionButton: SizedBox(
        width: 120,
        height: 42,
        child: FloatingActionButton.extended(
          backgroundColor: C2,
          onPressed: () {},
          label: const Text(
              'Ajouter ',
              style: TextStyle(color: C3)
          ),
          icon: const Icon(Icons.add, color: C3),
        ),

      ),

    );
  }
}
