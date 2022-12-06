import 'package:flutter/material.dart';

import '../../models/beer.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  const BeerCard({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(beer.name),
            subtitle: Text(beer.style),
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.science),
                    Text('Make it yourself!'),
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
      ),
    );
  }
}
