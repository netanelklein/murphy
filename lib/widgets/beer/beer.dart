import 'package:flutter/material.dart';
import 'package:murphy/screens/our_beer/beer_edit.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../models/beer.dart';
import '../../models/recipe.dart';
import '../../widgets/beer/recipe.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  static const Recipe recipe = Recipe(
      name: 'Test Recipe',
      style: 'Test Style',
      abv: 5.5,
      ibu: 30,
      mashTemp: 66,
      mashTime: 60,
      og: 1.050,
      fg: 1.010,
      srm: 6,
      fermentables: [
        Fermentable(name: 'Pale Malt', amount: 9.0, percentage: 90),
        Fermentable(name: 'Caramel Malt', amount: 1.0, percentage: 10),
      ],
      hops: [
        Hop(name: 'Cascade', amount: 30, alpha: 5, time: 60, use: HopUse.fwh),
        Hop(name: 'Cascade', amount: 30, alpha: 5, time: 30, use: HopUse.boil),
        Hop(
            name: 'Cascade',
            amount: 30,
            alpha: 5,
            time: 15,
            use: HopUse.hopstand),
        Hop(
            name: 'Cascade',
            amount: 30.0,
            alpha: 5,
            time: 5,
            use: HopUse.dryhop),
      ],
      yeast: Yeast(name: 'Safale US-05', amount: 1),
      waterProfile: WaterProfile(
          name: 'Test Water Profile',
          calcium: 100,
          bicarbonate: 100,
          sulfate: 100,
          chloride: 100,
          sodium: 100,
          magnesium: 100));

  const BeerCard({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Consumer<AppState>(builder: (context, appState, _) {
        return Column(
          children: [
            ListTile(
              title: Text(beer.name),
              subtitle: Text(beer.style),
              trailing: appState.isAdmin
                  ? IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeerEdit(beer: beer),
                          ),
                        );
                      },
                    )
                  : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ABV: ${beer.abv}%'),
                Text('IBU: ${beer.ibu}'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(beer.description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return const RecipeModal(recipe: recipe);
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0))),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.science),
                      Text('Brew it yourself!'),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Add to cart'),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
