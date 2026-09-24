import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/colors.dart';
import '../data/Instrument_list.dart';
import '../widgets/instrument_card.dart';
import '../widgets/bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // l'app bar
      appBar: AppBarMs(),

      // le corps de l'écran
      body: SafeArea(
        child: Padding(

            padding: EdgeInsets.all(8),

            child: Column(

              children: <Widget>[

                // la barre de recherche
                SearchBarMs(),

                // une sized box pour séparer la barre de recherche de la liste des instruments
                const SizedBox(height: 12),

                // liste des instruments
                Expanded(
                  child: GridView.builder(

                    itemCount: mesInstruments.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.72,
                    ),

                    itemBuilder: (context, index) {
                      final instrument = mesInstruments[index];
                      return InstrumentCard(
                          instrument: instrument
                      );
                    },
                  ),
                ),

              ],

            )

        ),



      ),

      floatingActionButton: SizedBox(
          width: 120,
          height: 42,
          child:FloatingActionButton.extended(
            backgroundColor: C2,
            onPressed: () {},
            label: Text(
              'Ajouter ',
              style: TextStyle(
                  color: C3
              ),
            ),
            icon: Icon(
              Icons.add,
              color: C3,
            ),
          )
      ),

      // la bottom app bar
      bottomNavigationBar: BottomAppBarMs(),

    );
  }
}