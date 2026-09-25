import 'package:flutter/material.dart';
import '../models/instrument_model.dart';
import '../providers/panier_providers.dart';
import '../widgets/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favoris_providers.dart';


class InstrumentCard extends ConsumerWidget {
  final Instrument instrument;

  const InstrumentCard({
    super.key,
    required this.instrument
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estFavoris = ref.watch(favorisProvider).any((item) => item.id == instrument.id);
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
                  child: Image.network(
                    width: double.infinity,
                    instrument.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: C5,
                        size: 40,
                      ),
                    ),
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
                            instrument.nom,
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
                            ref.read(favorisProvider.notifier).toggleFavori(instrument);
                          },
                          icon: Icon(
                            estFavoris ? Icons.favorite : Icons.favorite_border,
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



                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,

                          children: <Widget>[

                            Text(
                              instrument.categorie.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: C5,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Container(
                              decoration: BoxDecoration(
                                color: C1,
                              borderRadius: BorderRadius.circular(8),
                              ),

                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              child: Text(
                                  '${instrument.prix} \$',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: C3,
                                  )
                              ),
                            )]
                        ),

                        const SizedBox(width: 4),

                        IconButton.filled(

                          style: IconButton.styleFrom(
                            backgroundColor: C2,
                            padding: const EdgeInsets.all(6),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),

                          onPressed: () {
                            ref.read(panierProvider.notifier).ajouterArticle(instrument);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${instrument.nom} ajouté au panier !'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },

                          // icone du panier pour commander un instrument
                          icon: const Icon(Icons.add_shopping_cart, color: C3, size: 16),
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
