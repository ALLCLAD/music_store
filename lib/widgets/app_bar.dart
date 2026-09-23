import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/colors.dart';
import 'package:flutter/material.dart';
class AppBarMs extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: C3,
      elevation: 0,

      leading: AppCircleAvatar(),

      title: Center(
          child: const Text.rich(
            TextSpan(
              text:'Music',
              style: TextStyle(
                color: C2,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),

            children : <TextSpan>[
              TextSpan(
                text: ' Store',
                style: TextStyle(
                    color: C1,
                    fontSize: 35,
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
                  size: 30,
          )
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
