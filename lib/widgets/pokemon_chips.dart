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
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          types.map((type) {
            Color borderColor = PokemonColors.getTypeColor(type, shade: 600);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  '${typeEmojis[type] ?? ''} ${type.capitalize()}',
                  style: TextStyle(color: borderColor, fontSize: 10),
                ),
              ),
            );
          }).toList(),
    );
  }
}
