import 'package:flutter/material.dart';
import 'package:test1/models/pokemon.dart';
import 'package:test1/theme/pokemon_colors.dart';
import 'package:test1/utils/pokemon_emojis.dart';

class PokemonTypeChips extends StatelessWidget {
  final List<String> types;

  const PokemonTypeChips({required this.types, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          types
              .map(
                (type) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Chip(
                    label: Text(
                      '${typeEmojis[type] ?? ''} ${type.capitalize()}',
                    ),
                    backgroundColor: PokemonColors.getTypeColor(type),
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              )
              .toList(),
    );
  }
}
