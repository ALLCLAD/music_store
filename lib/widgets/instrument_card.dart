import 'package:flutter/material.dart';
import 'package:e_instru/models/instrument_model.dart';
import 'package:e_instru/widgets/colors.dart';


class InstrumentCard extends StatefulWidget {
  final Instrument instrument;

  const InstrumentCard({
    super.key,
    required this.instrument
  });

  @override
  State<InstrumentCard> createState() => _InstrumentCardState();
}

class _InstrumentCardState extends State<InstrumentCard> {

  // méthode pour mettre un instrument en favoris
  void mettreEnFavoris() {
    setState(() {
      widget.instrument.estFavoris = !widget.instrument.estFavoris;
    });
  }

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

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // section pour l'image de l'instrument
                Expanded(
                  child: Image.asset(
                    width: double.infinity,
                    widget.instrument.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),


                // section pour le nom de l'instrument et favoris
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 2.0, top: 4.0),
                    child: Row(
                      children: <Widget>[

                        // section pour le nom de l'instrument
                        Expanded(
                          child: Text(
                            widget.instrument.nom,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // section pour le bouton favoris
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(4),
                          onPressed: () {
                            mettreEnFavoris();
                          },
                          icon: Icon(
                            widget.instrument.estFavoris ? Icons.favorite : Icons.favorite_border,
                            color: C5,
                            size: 18,
                          ),
                        )

                      ],
                    )
                ),

                // section pour le prix de l'instrument et le panier pour commander un instrument
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 2.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children:<Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: C1,
                            borderRadius: BorderRadius.circular(8),
                          ),

                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                              '${widget.instrument.prix} FcFA',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: C3,
                              )
                          ),
                        ),

                        const SizedBox(width: 4),

                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration:
                            const BoxDecoration(
                              color: C2,
                              shape: BoxShape.circle,
                            ),
                          child: const Icon(
                                Icons.add_shopping_cart,
                                color: C3,
                                size: 16,
                              )
                            ),
                          ),
                      ]
                  ),
                )

              ]
          )
      ),

    );
  }
}
