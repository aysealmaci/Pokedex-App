import 'package:flutter/material.dart';
import 'package:pokedex_app/const/colors.dart';
import 'package:pokedex_app/const/sizes.dart';
import 'package:pokedex_app/data/providers/pokemon_provider.dart';
import 'package:pokedex_app/screens/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String favScreenTitle="Favori Pokemonlarınız";
    const String noFav="Henüz favori Pokemonunuz yok.";
    const String removeFromFav=" Favorilerden çıkarıldı.";
   
    final pokemonProvider = Provider.of<PokemonProvider>(context);

    return Scaffold(
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const Padding(
            padding: EdgeInsets.all(CustomSize.marginSize), 
            child: Text(
              favScreenTitle,
              style: TextStyle(
                fontSize: CustomSize.fontSizelarge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded( 
            child: pokemonProvider.favoritePokemonList.isEmpty
                ? const Center(child: Text(noFav))
                : ListView.builder(
                    itemCount: pokemonProvider.favoritePokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonProvider.favoritePokemonList[index];
                      return Dismissible(
                        key: Key(pokemon.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          pokemonProvider.toggleFavorite(pokemon);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.primaryColor,
                                content:
                                    Text('${pokemon.name} ${removeFromFav}')),
                          );
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: CustomSize.marginSize),
                          color: AppColors.primaryColor,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: ListTile(
                          title: Text(pokemon.name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetailScreen(
                                  pokemonUrl: pokemon.url,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

