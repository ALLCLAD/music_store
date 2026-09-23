import 'package:flutter/material.dart';
import 'package:e_instru/widgets/colors.dart';

class SearchBarMs extends StatefulWidget {
  const SearchBarMs({super.key});

  @override
  _SearchBarMsState createState() => _SearchBarMsState();
}

class _SearchBarMsState extends State<SearchBarMs> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
            Icons.search,
            color: C2,
        ),

        hintText: 'Rechercher.....',

        hintStyle: TextStyle(
          color: C2,
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: C2,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(30)
          ),
        ),

        filled: true,
        fillColor: C3,
      ),
    );
  }
}
