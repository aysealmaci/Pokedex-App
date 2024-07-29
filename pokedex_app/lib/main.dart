import 'package:flutter/material.dart';
import 'package:pokedex_app/data/providers/pokemon_provider.dart';
import 'package:pokedex_app/screens/pokemon_list_screen.dart';
import 'package:pokedex_app/const/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)
 => PokemonProvider()),
      ],
      child: const MyApp(),
    ),
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      debugShowCheckedModeBanner: false,
      theme: PokedexTheme.getTheme(),
      home: const PokemonListScreen(),
    );
  }
}

