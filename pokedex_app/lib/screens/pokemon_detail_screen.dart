import 'package:flutter/material.dart';
import 'package:pokedex_app/const/colors.dart';
import 'package:pokedex_app/const/global_texts.dart';
import 'package:pokedex_app/custom_widgets/pokemon_detail_card.dart';
import 'package:pokedex_app/data/models/pokemon_detail.dart';
import 'package:pokedex_app/data/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatefulWidget {
  final String pokemonUrl;

  const PokemonDetailScreen({super.key, required this.pokemonUrl});

  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(GlobalText.appName, style: TextStyle(
          color: AppColors.appBarTitle 
        ),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, pokemonProvider, child) {
          return FutureBuilder<PokemonDetail>(
            future: pokemonProvider.fetchPokemonDetail(widget.pokemonUrl),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Hata: ${snapshot.error}'));
              } else {
                final pokemonDetail = snapshot.data!;
                return PokemonDetailCard(pokemonDetail: pokemonDetail); 
              }
            },
          );
        },
      ),
    );
  }
}
