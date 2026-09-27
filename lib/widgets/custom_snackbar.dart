import 'package:flutter/material.dart';
import 'colors.dart'; // Ajuste le chemin selon la structure de ton dossier

/// Fonction utilitaire globale pour afficher une SnackBar style "Toast"
void showCustomSnackBar(
    BuildContext context, {
      required String message,
      IconData? icon,
      Duration duration = const Duration(seconds: 2),
    }) {
  // Annule la SnackBar précédente si elle est encore affichée
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: duration,
        elevation: 3,
        backgroundColor: C2, // Couleur de fond sombre du thème
        behavior: SnackBarBehavior.floating,

        padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Coins arrondis
        ),

        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        content: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            mainAxisSize: MainAxisSize.min,

            children: [
              if (icon != null) ...[
                Icon(icon, color: C3, size: 18),
              const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: C3,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
        ),
    ),
  );
}