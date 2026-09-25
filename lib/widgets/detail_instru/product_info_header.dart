import 'package:flutter/material.dart';
import '../colors.dart';

class ProductInfoHeader extends StatelessWidget {
  final String nom;
  final String categorie;
  final double prix;

  const ProductInfoHeader({
    super.key,
    required this.nom,
    required this.categorie,
    required this.prix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Badge Catégorie
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: C1.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                categorie.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: C1,
                  letterSpacing: 0.8,
                ),
              ),
            ),

            // Badge Prix
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: C1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$prix \$',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: C3,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          nom,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: C2,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}