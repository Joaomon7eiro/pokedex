import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../utils/util.dart';

import '../pages/details_page.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonItem(this.pokemon);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsPage.routeName, arguments: {
          "pokemon": pokemon,
          "color": Util.getColor(pokemon.type[0])
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: -10,
                right: -5,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Hero(
                  tag: pokemon.num,
                  child: Image.network(
                    pokemon.image,
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Text(
                          pokemon.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            pokemon.type.map((type) => TypeText(type)).toList(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          color: Util.getColor(pokemon.type[0]),
        ),
      ),
    );
  }
}

class TypeText extends StatelessWidget {
  final String type;

  const TypeText(this.type);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.white30,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            type,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
