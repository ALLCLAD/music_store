import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,

      obscureText: true,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.more_horiz),
        labelText: 'Mot de pase',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.remove_red_eye)
      ),

      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Veuillez entrer votre mot de passe';
      }
      return null;
      },


    );
  }
}
