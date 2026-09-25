import 'package:flutter/material.dart';
import 'package:e_instru/widgets/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_providers.dart';

class BottomAppBarMs extends ConsumerWidget {

  const BottomAppBarMs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentIndex = ref.watch(navigationIndexProvider);

    return BottomAppBar(
      color: C3,
      elevation: 8,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[

          IconButton(

            onPressed: () => ref.read(navigationIndexProvider.notifier).state = 0,

            icon: Icon(
              currentIndex == 0 ? Icons.home : Icons.home_outlined,
              color: currentIndex == 0 ? C2 : C2,
              size: 30,
            ),

          ),

          IconButton(

            onPressed: () => ref.read(navigationIndexProvider.notifier).state = 1,

            icon: Icon(
              currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
              color: currentIndex == 1 ? C2 : C2,
              size: 30,
            ),

          ),

          IconButton(

            onPressed: () => ref.read(navigationIndexProvider.notifier).state = 2,

            icon: Icon(
              currentIndex == 2 ? Icons.shopping_basket : Icons.shopping_basket_outlined,
              color: currentIndex == 2 ? C2 : C2,
              size: 30,
            ),

          ),

        ],

      ),
    );
  }
}