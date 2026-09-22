import 'package:flutter/material.dart';

class AppCircleAvatar  extends StatelessWidget {
  const AppCircleAvatar ({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
    backgroundImage: AssetImage('assets/images/music_store.png'),
    );
  }
}
