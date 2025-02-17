import 'package:flutter/material.dart';
import 'package:test1/models/pokemon.dart';
import 'package:test1/theme/pokemon_colors.dart';

class PokemonStats extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonStats({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statBackgroundColor = PokemonColors.getTypeColor(
      pokemon.types[0],
      shade: 400,
    );
    final statColor = PokemonColors.getTypeColor(pokemon.types[0]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description: ${pokemon.description}',
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16),
        const Text(
          'Estadísticas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatRow(
              context,
              'HP',
              pokemon.hp,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Attack',
              pokemon.attack,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Defense',
              pokemon.defense,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Special Defense',
              pokemon.specialDefense,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Speed',
              pokemon.speed,
              statBackgroundColor,
              statColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    String label,
    int value,
    Color statBackgroundColor,
    Color statColor,
  ) {
    double percentage = (value / 100).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: statBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 12,
                  width: MediaQuery.of(context).size.width * 0.4 * percentage,
                  decoration: BoxDecoration(
                    color: statColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text('$value'),
        ],
      ),
    );
  }
}
