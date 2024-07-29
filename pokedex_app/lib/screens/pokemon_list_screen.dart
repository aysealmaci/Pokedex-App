import 'package:flutter/material.dart';
import 'package:pokedex_app/const/colors.dart';
import 'package:pokedex_app/const/sizes.dart';
import 'package:pokedex_app/const/global_texts.dart';
import 'package:pokedex_app/data/providers/pokemon_provider.dart';
import 'package:pokedex_app/screens/favorite_list_screen.dart';
import 'package:pokedex_app/screens/pokemon_detail_screen.dart';
import 'package:provider/provider.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  _PokemonListScreenState createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PokemonListScreenContent(),
    const FavoriteListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<PokemonProvider>(context, listen: false).fetchPokemonList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const String favText="Favoriler";
    const String pokemonListText="Pokemon Listesi";

    return Scaffold(
      appBar: AppBar(
        title: const Text(GlobalText.appName,
        style: TextStyle(
        color: AppColors.appBarTitle
      ),
  ),
  
  actions: [
    Center(
      child: Padding(
        padding: const EdgeInsets.only(right: CustomSize.marginSize),
        child: Consumer<PokemonProvider>(
          builder: (context, pokemonProvider, _) => Text(
            '${favText}: ${pokemonProvider.favoritePokemonList.length}',
            style: const TextStyle(fontSize: CustomSize.fontSizelarge,
            color: AppColors.textColor),
          ),
        ),
      ),
    ),
  ],
),
      body: _screens[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: pokemonListText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: favText,
            
          ),
        ],
      ),
    );
  }
}

class PokemonListScreenContent extends StatelessWidget {
  const PokemonListScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(
      builder: (context, pokemonProvider, child) {
        if (pokemonProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: pokemonProvider.pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonProvider.pokemonList[index];
              return ListTile(
                title: Text(pokemon.name),
                trailing: IconButton(
                  icon: Icon(
                    pokemonProvider.favoritePokemonList.contains(pokemon)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: pokemonProvider.favoritePokemonList.contains(pokemon)
                        ? AppColors.favButtonColor
                        : null,
                  ),
                  onPressed: () {
                    pokemonProvider.toggleFavorite(pokemon);
                  },
                ),
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
              );
            },
          );
        }
      },
    );
  }
}
