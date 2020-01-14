import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/pokemon.dart';
import 'dart:convert';

class PokedexProvider extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  var dio = Dio();

  loadData() async {
    var response = await dio.get(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json?fbclid=IwAR2pqSC1DDueCchqljIgSP3vsTWF8PNXXX9kBPSUHAZbpAuk6KOId9dTUp4');

    var data = json.decode(response.data.toString());

    for (var pokemon in data['pokemon']) {
      pokemons.add(Pokemon.fromJson(pokemon));
    }

    notifyListeners();
  }
}
