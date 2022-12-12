import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:murphy/models/beer.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class BeerEdit extends StatefulWidget {
  const BeerEdit({super.key, this.beer});

  final Beer? beer;

  @override
  State<BeerEdit> createState() => _BeerEditState();
}

class _BeerEditState extends State<BeerEdit> {
  final List<bool> _isOpen = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Form(child: Consumer<AppState>(builder: (context, appState, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Beer'),
          actions: [
            IconButton(
                onPressed: (() {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Save Beer')));
                }),
                icon: const Icon(Icons.save))
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(8), children: [
          TextFormField(
            initialValue: widget.beer?.name,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (value) {
              setState(() {
                // widget.beer.name = value;
              });
            },
          ),
          TextFormField(
            initialValue: widget.beer?.style,
            decoration: const InputDecoration(
              labelText: 'Style',
            ),
            onChanged: (value) {
              setState(() {
                // widget.beer.style = value;
              });
            },
          ),
          TextFormField(
            initialValue: widget.beer?.abv.toString(),
            decoration: const InputDecoration(
              labelText: 'ABV',
            ),
            onChanged: (value) {
              setState(() {
                // widget.beer.abv = double.parse(value);
              });
            },
          ),
          TextFormField(
            initialValue: widget.beer?.ibu.toString(),
            decoration: const InputDecoration(
              labelText: 'IBU',
            ),
            onChanged: (value) {
              setState(() {
                // widget.beer.ibu = double.parse(value);
              });
            },
          ),
          TextFormField(
            initialValue: widget.beer?.description,
            // expands: true,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            onChanged: (value) {
              setState(() {
                // widget.beer.description = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Text('Recipe:', style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 8),
          ExpansionPanelList(
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    title: Text('Details'),
                    leading: FaIcon(
                      FontAwesomeIcons.circleInfo,
                    ),
                  );
                },
                body: const Text('Details'),
                isExpanded: _isOpen[0],
                canTapOnHeader: true,
              ),
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Fermentables'),
                      leading: FaIcon(FontAwesomeIcons.wheatAwn,
                          color: Colors.amber),
                    );
                  },
                  body: Column(
                    children: [
                      for (var fermentable
                          in widget.beer?.recipe?.fermentables ?? [])
                        Row(
                          children: [
                            TextFormField(
                              initialValue: fermentable.name,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // fermentable.name = value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: fermentable.percentage.toString(),
                              decoration: const InputDecoration(
                                labelText: 'Percentage',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // fermentable.percentage = double.parse(value);
                                });
                              },
                            )
                          ],
                        ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // widget.beer.recipe.fermentables.add(Fermentable());
                            });
                          },
                          child: const Text('Add Fermentable'))
                    ],
                  ),
                  isExpanded: _isOpen[1],
                  canTapOnHeader: true),
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Hops'),
                      leading: FaIcon(FontAwesomeIcons.spa,
                          color: Color(0xFF49b792)),
                    );
                  },
                  body: Column(
                    children: [
                      for (var hop in widget.beer?.recipe?.hops ?? [])
                        Row(
                          children: [
                            TextFormField(
                              initialValue: hop.name,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // hop.name = value;
                                });
                              },
                            ),
                            TextFormField(
                              initialValue: hop.percentage.toString(),
                              decoration: const InputDecoration(
                                labelText: 'Percentage',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // hop.percentage = double.parse(value);
                                });
                              },
                            )
                          ],
                        ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // widget.beer.recipe.hops.add(Hop());
                            });
                          },
                          child: const Text('Add Hop'))
                    ],
                  ),
                  isExpanded: _isOpen[2],
                  canTapOnHeader: true),
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Yeast'),
                      leading:
                          FaIcon(FontAwesomeIcons.flask, color: Colors.red),
                    );
                  },
                  body: Text('Yeast'),
                  isExpanded: _isOpen[3],
                  canTapOnHeader: true),
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Misc'),
                      leading: FaIcon(FontAwesomeIcons.wandSparkles,
                          color: Colors.brown),
                    );
                  },
                  body: Text('Misc'),
                  isExpanded: _isOpen[4],
                  canTapOnHeader: true),
              ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      title: Text('Water Profile'),
                      leading:
                          FaIcon(FontAwesomeIcons.droplet, color: Colors.cyan),
                    );
                  },
                  body: Text('Water'),
                  isExpanded: _isOpen[5],
                  canTapOnHeader: true),
            ],
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _isOpen[panelIndex] = !_isOpen[panelIndex];
              });
            },
          )
        ]),
      );
    }));
  }
}
