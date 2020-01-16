import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailsPage extends StatelessWidget {
  static final routeName = 'details-page';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    Pokemon pokemon = args["pokemon"];

    return Scaffold(
      backgroundColor: args["color"],
      body: Stack(
        children: <Widget>[
          Center(
            child: Hero(
              tag: pokemon.num,
              child: Image.network(
                pokemon.image,
                width: 70,
                height: 70,
              ),
            ),
          ),
          SlidingSheet(
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.55, 0.88],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text('This is the content of the sheet'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
