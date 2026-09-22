
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre email';
        }
        return null;
      },
    );
  }
}
