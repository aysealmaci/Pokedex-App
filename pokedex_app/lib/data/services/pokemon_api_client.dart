import 'package:dio/dio.dart';
import 'package:pokedex_app/data/models/pokemon_detail.dart';
import 'package:pokedex_app/data/models/pokemons.dart';


class PokemonClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemonList() async {
    try {
      final response = await _dio.get(_baseUrl);
      final List<dynamic> results = response.data['results'];
      return results.map((json) => Pokemon.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Pokemon listesi getirilemedi: ${e.message}');
    }
  }

    Future<PokemonDetail> fetchPokemonDetail(String url) async {
      try {
        final response = await _dio.get(url);
        return PokemonDetail.fromJson(response.data);
        } on DioException catch (e) {
        throw Exception('Pokemon detayları getirilemedi: ${e.message}');
    }
  }
  
}
