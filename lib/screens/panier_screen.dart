import 'package:flutter/material.dart';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  String nom = 'Ahmed';
  int n = 0;
  void salutation() {
    setState(() {
      nom = nom + n.toString();
      n++;
      print('Bonjour $nom');
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Panier'),
      ),

      body: Column(
        children: <Widget>[
          Text("Bonjour $nom"),
          ElevatedButton(
            onPressed: salutation,
            child: const Text('Saluer')
          ),

        ]
      )

    );
  }
}
