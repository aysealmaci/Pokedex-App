import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_detail.dart';
import 'package:pokedex_app/data/models/pokemons.dart';
import 'package:pokedex_app/data/services/pokemon_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonClient _pokemonClient = PokemonClient();
  List<Pokemon> _pokemonList = [];
  List<Pokemon> _favoritePokemonList = [];
  bool _isLoading = false;
  

  List<Pokemon> get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;

   static const String _favoritesKey = 'favoritePokemonNames';

  PokemonProvider() {
    fetchPokemonList().then((_) => _loadFavorites()); 
  }
    Future<void> _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteNames = prefs.getStringList(_favoritesKey);
    if (favoriteNames != null) {
      _favoritePokemonList = _pokemonList
          .where((pokemon) => favoriteNames.contains(pokemon.name))
          .toList();
      notifyListeners();
    }
  }

    void toggleFavorite(Pokemon pokemon) async {
    if (_favoritePokemonList.contains(pokemon)) {
      _favoritePokemonList.remove(pokemon);
    } else {
      _favoritePokemonList.add(pokemon);
    }
    await _saveFavorites(); 
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteNames =
        _favoritePokemonList.map((pokemon) => pokemon.name).toList();
    await prefs.setStringList(_favoritesKey, favoriteNames);
  }

  Future<void> fetchPokemonList() async {
    _isLoading = true;
   
    try {
      _pokemonList = await _pokemonClient.fetchPokemonList();
    }  
    catch (e) {
      print('Hata: $e');
    } 
    finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
   List<Pokemon> get favoritePokemonList => _favoritePokemonList;

    Future<PokemonDetail> fetchPokemonDetail(String url) async {
      return await _pokemonClient.fetchPokemonDetail(url);
  }
}