import 'package:flutter/material.dart';

class CatalogSkeleton extends StatefulWidget {
  const CatalogSkeleton({super.key});

  @override
  State<CatalogSkeleton> createState() => _CatalogSkeletonState();
}

class _CatalogSkeletonState extends State<CatalogSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Animation de pulsation continue
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.3, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return GridView.builder(
          itemCount: 6, // Affiche 6 cartes factices pendant le chargement
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            return _buildSkeletonCard(_opacityAnimation.value);
          },
        );
      },
    );
  }

  // Widget représentant une carte squelette identique à InstrumentCard
  Widget _buildSkeletonCard(double opacity) {
    final colorPlaceholder = Colors.grey.shade400.withOpacity(opacity);

    return Card(
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Emplacement Image Factice
          Expanded(
            child: Container(
              width: double.infinity,
              color: colorPlaceholder,
            ),
          ),

          // 2. Emplacement Titre & Bouton Favoris Factices
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colorPlaceholder,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: colorPlaceholder,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          // 3. Emplacement Prix & Bouton Panier Factices
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorPlaceholder,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                        color: colorPlaceholder,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colorPlaceholder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}