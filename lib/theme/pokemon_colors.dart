import 'package:flutter/material.dart';

class PokemonColors {
  static Color getTypeColor(String type, {int? shade}) {
    switch (type) {
      case 'fire':
        return (shade != null ? Colors.red[shade] : Colors.red[600]) ??
            Colors.red;
      case 'water':
        return (shade != null ? Colors.blue[shade] : Colors.blue[500]) ??
            Colors.blue;
      case 'grass':
        return (shade != null ? Colors.green[shade] : Colors.green[400]) ??
            Colors.green;
      case 'electric':
        return (shade != null ? Colors.yellow[shade] : Colors.yellow[700]) ??
            Colors.yellow;
      case 'poison':
        return (shade != null ? Colors.purple[shade] : Colors.purple[300]) ??
            Colors.purple;
      case 'flying':
        return (shade != null ? Colors.blue[shade] : Colors.blue[200]) ??
            Colors.lightBlue;
      case 'bug':
        return (shade != null ? Colors.green[shade] : Colors.green[600]) ??
            Colors.lightGreen;
      case 'normal':
        return (shade != null ? Colors.grey[shade] : Colors.grey[500]) ??
            Colors.grey;
      case 'ground':
        return (shade != null ? Colors.brown[shade] : Colors.brown[400]) ??
            Colors.brown;
      case 'fairy':
        return (shade != null ? Colors.pink[shade] : Colors.pink[300]) ??
            Colors.pink;
      case 'fighting':
        return (shade != null ? Colors.orange[shade] : Colors.orange[800]) ??
            Colors.orange;
      case 'psychic':
        return (shade != null
                ? Colors.purpleAccent[shade]
                : Colors.purpleAccent[700]) ??
            Colors.purpleAccent;
      case 'rock':
        return (shade != null ? Colors.brown[shade] : Colors.brown[700]) ??
            Colors.brown;
      case 'steel':
        return (shade != null
                ? Colors.blueGrey[shade]
                : Colors.blueGrey[500]) ??
            Colors.blueGrey;
      case 'ice':
        return (shade != null ? Colors.cyan[shade] : Colors.cyan[300]) ??
            Colors.cyan;
      case 'ghost':
        return (shade != null
                ? Colors.deepPurple[shade]
                : Colors.deepPurple[400]) ??
            Colors.deepPurple;
      case 'dragon':
        return (shade != null ? Colors.indigo[shade] : Colors.indigo[700]) ??
            Colors.indigo;
      default:
        return (shade != null ? Colors.grey[shade] : Colors.grey[400]) ??
            Colors.grey;
    }
  }
}
