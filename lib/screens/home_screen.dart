import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/colors.dart';
import '../data/Instrument_list.dart';
import '../widgets/instrument_card.dart';
import '../widgets/bottom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  child: ListView.separated(

                    itemCount: mesInstruments.length,

                    separatorBuilder: (context, index) => const SizedBox(height: 12),

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
          width: 110,
          height: 35,
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

