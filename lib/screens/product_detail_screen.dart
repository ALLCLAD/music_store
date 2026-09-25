import 'package:flutter/material.dart';
import '../models/instrument_model.dart';
import '../widgets/colors.dart';
import '../widgets/detail_instru/product_bottom_bar.dart';
import '../widgets/detail_instru/product_description.dart';
import '../widgets/detail_instru/product_detail_app_bar.dart';
import '../widgets/detail_instru/product_image_banner.dart';
import '../widgets/detail_instru/product_info_header.dart';

class ProductDetailScreen extends StatelessWidget {
  final Instrument instrument;

  const ProductDetailScreen({
    super.key,
    required this.instrument,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C3,

      // Custom AppBar modularisée
      appBar: const ProductDetailAppBar(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // 1. Bannière Image
            ProductImageBanner(imageUrl: instrument.imageUrl),

            const SizedBox(height: 20),

            // 2. En-tête des informations & Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfoHeader(
                    nom: instrument.nom,
                    categorie: instrument.categorie,
                    prix: instrument.prix,
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: Colors.black12, thickness: 1),
                  const SizedBox(height: 16),

                  ProductDescription(description: instrument.description),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),

      // 3. Barre d'action inférieure
      bottomNavigationBar: ProductBottomBar(instrument: instrument),
    );
  }
}