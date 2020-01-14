import 'package:flutter/material.dart';

import '../widgets/pokemon_item.dart';
import 'package:provider/provider.dart';
import '../providers/pokedex_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokedexProvider>(context, listen: false).loadData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final appBarSize = AppBar().preferredSize.height;
    var pokemons = Provider.of<PokedexProvider>(context).pokemons;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -20,
            right: -50,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pokeball_dark.png',
                width: width * 0.55,
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: appBarSize),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    'Pokedex',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return PokemonItem(pokemons[index]);
                    },
                    childCount: pokemons.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 5 / 4),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
