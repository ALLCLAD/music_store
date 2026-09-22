// Widget pour le champ mot de passe pour les formulaires d'inscription et de connexion
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,

      obscureText: _isObscured,

      decoration: InputDecoration(
          prefixIcon: Icon(Icons.more_horiz),
          labelText: 'Mot de pase',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState((){
                _isObscured = !_isObscured;
              });
            },
          )
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
