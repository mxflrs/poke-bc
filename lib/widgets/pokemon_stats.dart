import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/models/pokemon.dart';
import 'package:test1/theme/app_colors.dart';
import 'package:test1/theme/pokemon_colors.dart';

class PokemonStats extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonStats({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final statColor = PokemonColors.getTypeColor(pokemon.types[0], shade: 400);
    final statBackgroundColor = PokemonColors.getTypeColor(
      pokemon.types[0],
      shade: 200,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            pokemon.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Estadísticas',
          style: GoogleFonts.montserrat(
            color: AppColors.navyBlue,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
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
              'Ataque',
              pokemon.attack,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Defensa',
              pokemon.defense,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Defensa Especial',
              pokemon.specialDefense,
              statBackgroundColor,
              statColor,
            ),
            _buildStatRow(
              context,
              'Velocidad',
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
    String formattedValue =
        value == 100
            ? '100'
            : value < 10
            ? '0$value'
            : '$value';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: statBackgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 16,
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
          Text(formattedValue),
        ],
      ),
    );
  }
}
