import 'package:flutter/material.dart';

class PokemonColors {
  static Color getTypeColor(String type) {
    switch (type) {
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.yellow;
      case 'poison':
        return Colors.purple;
      case 'flying':
        return Colors.lightBlue;
      case 'bug':
        return Colors.lightGreen;
      case 'normal':
        return Colors.grey;
      case 'ground':
        return Colors.brown;
      case 'fairy':
        return Colors.pink;
      case 'fighting':
        return Colors.orange;
      case 'psychic':
        return Colors.purpleAccent;
      case 'rock':
        return Colors.brown.shade700;
      case 'steel':
        return Colors.blueGrey;
      case 'ice':
        return Colors.cyan;
      case 'ghost':
        return Colors.deepPurple;
      case 'dragon':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }
}
