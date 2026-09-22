import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // l'app bar
      appBar: AppBar(
        // titre de l'app
        title: const Text('E-INSTRU'),
        // les actions
        actions: <Widget>[
          Icon(
            Icons.notifications
          )
        ],

      ),

    );
  }
}

