import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/home_page.dart';

import 'package:provider/provider.dart';
import './providers/pokedex_provider.dart';

import './pages/details_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => PokedexProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/': (context) => HomePage(),
          DetailsPage.routeName: (context) => DetailsPage(),
        },
      ),
    );
  }
}
