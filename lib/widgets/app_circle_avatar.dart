// Widget pour l'image personalisé de l'application sous forme de cercle
import 'package:flutter/material.dart';


class AppCircleAvatar  extends StatelessWidget {
  const AppCircleAvatar ({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage('assets/images/music_store.png'),
    );
  }
}
