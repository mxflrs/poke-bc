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
      // First API call to get the list
      print('Fetching Pokemon list...');
      final response = await _dio.get(
        '/pokemon',
        queryParameters: {'limit': 151, 'offset': 0},
      );

      if (response.data == null) {
        print('Error: Empty response from API');
        throw Exception('Empty response from API');
      }

      final List<Pokemon> pokemonList = [];
      final results = response.data['results'] as List;

      print('Found ${results.length} Pokemon. Fetching details...');

      // Fetch first 20 Pokemon for faster loading (remove this limit for production)
      for (var i = 0; i < 20; i++) {
        final pokemon = results[i];
        try {
          print('Fetching details for Pokemon at URL: ${pokemon['url']}');
          final detailResponse = await _dio.get(pokemon['url']);

          if (detailResponse.data != null) {
            final pokemonDetail = Pokemon.fromJson(detailResponse.data);
            pokemonList.add(pokemonDetail);
            print('Successfully added ${pokemonDetail.name}');
          }
        } catch (detailError) {
          print('Error fetching individual Pokemon: $detailError');
          // Continue with the next Pokemon instead of failing completely
          continue;
        }
      }

      if (pokemonList.isEmpty) {
        throw Exception('No Pokemon could be loaded');
      }

      print('Successfully loaded ${pokemonList.length} Pokemon');
      return pokemonList;
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      print('Dio Error Type: ${e.type}');
      print('Dio Error Response: ${e.response}');
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      print('General Error: $e');
      throw Exception('Failed to load Pokemon: $e');
    }
  }
}
