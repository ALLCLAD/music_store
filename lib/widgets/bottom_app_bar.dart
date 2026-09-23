import 'package:flutter/material.dart';
import 'package:e_instru/widgets/colors.dart';

class BottomAppBarMs extends StatelessWidget {
  const BottomAppBarMs({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: C3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              color: C2,
              size: 30,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: C2,
              size: 30,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: C2,
              size: 30,
            ),
          ),

        ]

      )
    );
  }
}
