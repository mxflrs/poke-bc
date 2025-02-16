import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {
  final PokemonService _service = PokemonService();
  List<Pokemon> _pokemonList = [];
  List<Pokemon> _filteredList = [];
  bool _isLoading = false;
  String _error = '';

  List<Pokemon> get pokemonList =>
      _filteredList.isEmpty ? _pokemonList : _filteredList;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadPokemon() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _pokemonList = await _service.getFirstGeneration();
      _filteredList = [];
    } catch (e) {
      _error = 'Failed to load Pokemon';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchPokemon(String query) {
    if (query.isEmpty) {
      _filteredList = [];
    } else {
      _filteredList =
          _pokemonList
              .where(
                (pokemon) =>
                    pokemon.name.toLowerCase().contains(query.toLowerCase()) ||
                    pokemon.id.toString() == query,
              )
              .toList();
    }
    notifyListeners();
  }
}
