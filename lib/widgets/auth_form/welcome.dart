import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text:'Bienvenue chez',
        style: TextStyle(
            color: Color.fromARGB(255, 15, 59, 74),
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),

        children : <TextSpan>[
          TextSpan(
              text: ' Music Store',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          )
        ],
      ),

    );
  }
}
