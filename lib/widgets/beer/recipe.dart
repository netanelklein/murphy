import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/recipe.dart';
import '../../style/srm_pallete.dart';

class RecipeModal extends StatelessWidget {
  const RecipeModal({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text(recipe.name), subtitle: Text(recipe.style)),
        Details(recipe: recipe),
        FermetablesCard(recipe: recipe),
        HopsCard(recipe: recipe),
        YeastCard(recipe: recipe),
        MiscCard(),
        WaterCard(recipe: recipe),
      ],
    );
  }
}

class WaterCard extends StatelessWidget {
  const WaterCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: const Text('Water Profile'),
      leading: const FaIcon(
        FontAwesomeIcons.droplet,
        color: Colors.cyan,
      ),
      subtitle:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            const Text('Ca2+:',
                style: TextStyle(
                    color: Colors.cyan,
                    fontFeatures: <FontFeature>[FontFeature.superscripts()])),
            Text('${recipe.waterProfile.calcium}'),
          ],
        ),
        Column(
          children: [
            const Text('Mg2+:', style: TextStyle(color: Colors.cyan)),
            Text('${recipe.waterProfile.magnesium}'),
          ],
        ),
        Column(
          children: [
            const Text('Na+:', style: TextStyle(color: Colors.cyan)),
            Text('${recipe.waterProfile.sodium}'),
          ],
        ),
        Column(
          children: [
            const Text('Cl-:', style: TextStyle(color: Colors.cyan)),
            Text('${recipe.waterProfile.chloride}'),
          ],
        ),
        Column(
          children: [
            const Text('SO4 2-:', style: TextStyle(color: Colors.cyan)),
            Text('${recipe.waterProfile.sulfate}'),
          ],
        ),
        Column(
          children: [
            const Text('HCO3-:', style: TextStyle(color: Colors.cyan)),
            Text('${recipe.waterProfile.bicarbonate}'),
          ],
        ),
      ]),
    ));
  }
}

class MiscCard extends StatelessWidget {
  MiscCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
        child: ListTile(
      title: Text('Misc'),
      leading: FaIcon(
        FontAwesomeIcons.wandSparkles,
        color: Colors.brown,
      ),
    ));
  }
}

class YeastCard extends StatelessWidget {
  const YeastCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: const Text('Yeast'),
      leading: const FaIcon(
        FontAwesomeIcons.flask,
        color: Colors.red,
      ),
      subtitle: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(recipe.yeast.name),
              Text('${recipe.yeast.amount} g/L'),
            ],
          ),
        ],
      ),
    ));
  }
}

class HopsCard extends StatelessWidget {
  const HopsCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: const Text('Hops'),
      leading: const FaIcon(
        FontAwesomeIcons.spa,
        color: Color(0xFF49b792),
      ),
      subtitle: Column(
        children: [
          for (var hop in recipe.hops)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${hop.name} ${hop.alpha} %'),
                Text(hop.useString, textAlign: TextAlign.right),
              ],
            ),
        ],
      ),
    ));
  }
}

class FermetablesCard extends StatelessWidget {
  const FermetablesCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: const Text('Fermentables'),
      leading: const FaIcon(
        FontAwesomeIcons.wheatAwn,
        color: Color(0xFFF8BE00),
      ),
      subtitle: Column(children: [
        for (var fermentable in recipe.fermentables)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fermentable.name),
              Text('${fermentable.percentage} %'),
            ],
          ),
        Text('Mash @ ${recipe.mashTemp} °C for ${recipe.mashTime} min')
      ]),
    ));
  }
}

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('ABV: ', style: TextStyle(color: Colors.white)),
                    Text('${recipe.abv}%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Original Gravity: ',
                        style: TextStyle(color: Colors.white)),
                    Text('${recipe.og}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Final Gravity: ',
                        style: TextStyle(color: Colors.white)),
                    Text('${recipe.fg}'),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('IBU: ', style: TextStyle(color: Colors.white)),
                    Text('${recipe.ibu}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('SRM: ', style: TextStyle(color: Colors.white)),
                    Text('${recipe.srm}'),
                  ],
                ),
                Icon(
                  Icons.sports_bar_rounded,
                  color: srmPallete[recipe.srm],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
