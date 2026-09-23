import 'package:flutter/material.dart';
import 'package:e_instru/models/instrument_model.dart';
import 'package:e_instru/widgets/colors.dart';


class InstrumentCard extends StatelessWidget {
  final Instrument instrument;

  const InstrumentCard({
    super.key,
    required this.instrument
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      clipBehavior: Clip.antiAlias,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(

        onTap: () {},

        child: Column(
          children: <Widget>[

            // section pour l'image de l'instrument
            SizedBox(
              height: 180,
              child: ClipRect(
                child: Image.asset(
                  width: double.infinity,
                  instrument.imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            ),

            // section pour le nom de l'instrument et favoris
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 2.0, top: 4.0),
              child: Row(
                children: <Widget>[

                  // section pour le nom de l'instrument
                  Expanded(
                    child: Text(
                      instrument.nom,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // section pour le bouton favoris
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      instrument.estFavoris ? Icons.favorite : Icons.favorite_border,
                      color: C5,
                      size: 20,
                    ),
                  )

                ],
              )
            ),

            // section pour le prix de l'instrument
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    decoration: BoxDecoration(
                      color: C1,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        '${instrument.prix} FcFA',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: C3,
                        )
                      ),
                    )
                )
              ),
            )

          ]
        )
      ),

    );
  }
}
