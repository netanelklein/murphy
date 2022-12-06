import 'package:flutter/material.dart';

import '../../widgets/beer/beer.dart';
import '../../models/beer.dart';

class OurBeer extends StatefulWidget {
  const OurBeer({super.key, required this.beerList});

  final List<Beer> beerList;

  @override
  State<OurBeer> createState() => _OurBeerState();
}

class _OurBeerState extends State<OurBeer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var beer in widget.beerList) BeerCard(beer: beer),
      ],
    );
  }
}
