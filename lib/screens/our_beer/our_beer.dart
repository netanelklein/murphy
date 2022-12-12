import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
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
    return Consumer<AppState>(builder: (context, appState, _) {
      return Scaffold(
          body: ListView(
            children: [
              for (var beer in widget.beerList) BeerCard(beer: beer),
            ],
          ),
          floatingActionButton: appState.isAdmin
              ? FloatingActionButton(
                  onPressed: (() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add Beer')));
                  }),
                  child: const Icon(Icons.add))
              : null);
    });
  }
}
