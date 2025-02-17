import 'package:flutter/material.dart';
import 'package:test1/models/pokemon.dart';
import 'package:test1/theme/pokemon_colors.dart';
import 'package:test1/utils/pokemon_emojis.dart';

class PokemonTypeCapsules extends StatelessWidget {
  final List<String> types;

  const PokemonTypeCapsules({required this.types, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          types
              .map(
                (type) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: PokemonColors.getTypeColor(type),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      '${typeEmojis[type] ?? ''} ${type.capitalize()}',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}
