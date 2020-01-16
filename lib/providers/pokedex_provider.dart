import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/pokemon.dart';
import 'dart:convert';

class PokedexProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  var dio = Dio();

  loadData() async {
    if (pokemons.length > 0) return;

    var response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json?fbclid=IwAR2pqSC1DDueCchqljIgSP3vsTWF8PNXXX9kBPSUHAZbpAuk6KOId9dTUp4');

    var data = json.decode(response.data.toString());

    for (var pokemon in data['pokemon']) {
      Pokemon pokemonData = Pokemon.fromJson(pokemon);
      pokemonData.image =
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokemonData.num}.png';
      pokemons.add(pokemonData);
    }

    notifyListeners();
  }
}
