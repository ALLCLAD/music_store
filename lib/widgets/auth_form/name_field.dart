//Widget pour le champ nom pour les formulaires d'inscription et de connexion
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Nom',
        border: OutlineInputBorder(),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre nom';
        }
        return null;
      },
    );
  }
}
