import 'package:dio/dio.dart';
import '../models/pokemon.dart';

class PokemonService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
      connectTimeout: const Duration(seconds: 5),
    ),
  );

  Future<List<Pokemon>> getFirstGeneration() async {
    try {
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {'limit': 151, 'offset': 0},
      );

      if (response.data == null) {
        throw Exception('Empty response from API');
      }

      final List<Pokemon> pokemonList = [];
      final results = response.data['results'] as List;

      for (var i = 0; i < 20; i++) {
        final pokemon = results[i];
        try {
          final detailResponse = await _dio.get(pokemon['url']);

          if (detailResponse.data != null) {
            final pokemonDetail = Pokemon.fromJson(detailResponse.data);
            pokemonList.add(pokemonDetail);
          }
        } catch (detailError) {
          continue;
        }
      }

      if (pokemonList.isEmpty) {
        throw Exception('No Pokemon could be loaded');
      }

      return pokemonList;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load Pokemon: $e');
    }
  }
}
