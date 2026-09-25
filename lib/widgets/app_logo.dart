import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final String imagePath;

  const AppLogo({
    super.key,
    this.size = 40.0,
    this.imagePath = 'assets/images/shopVerse.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * 0.28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.28),
        child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.shopping_bag_rounded,
                color: C1,
                size: size * 0.6,
              );
            },
          ),

      ),
    );
  }
}