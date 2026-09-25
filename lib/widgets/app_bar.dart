import 'package:e_instru/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'app_logo.dart';

class AppBarMs extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: C3,
      elevation: 8,
      centerTitle: true,
      leadingWidth: 60,

      leading: const Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Center(
          child: AppLogo(
            size: 40,
          ),
        ),
      ),

      title: const Text.rich(
        TextSpan(
          text: 'Shop',
          style: TextStyle(
            color: C2,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' Verse',
              style: TextStyle(
                color: C1,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: C2,
            size: 26,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}