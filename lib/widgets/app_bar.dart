import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/colors.dart';
import 'package:flutter/material.dart';
class AppBarMs extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: C3,
      elevation: 8,

      leading: AppCircleAvatar(),

      title: Center(
          child: const Text.rich(
            TextSpan(
              text:'Music',
              style: TextStyle(
                color: C2,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),

            children : <TextSpan>[
              TextSpan(
                text: ' Store',
                style: TextStyle(
                    color: C1,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                )
              )
            ],
          ),
          )
      ),

      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon:  Icon(
                  Icons.notifications,
                  color: C2,
                  size: 26,
          )
        ),
        SizedBox(width: 8),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
