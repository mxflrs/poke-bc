import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/models/pokemon.dart';
import 'package:test1/theme/app_colors.dart';
import 'package:test1/theme/pokemon_colors.dart';
import 'package:test1/widgets/pokemon_chips.dart';
import 'package:test1/widgets/pokemon_stats.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final primaryType = pokemon.types.isNotEmpty ? pokemon.types[0] : 'normal';
    final typeColor = PokemonColors.getTypeColor(primaryType, shade: 400);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(6),
              child: Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.off,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 170),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: typeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              if (pokemon.imageUrl.isNotEmpty)
                Positioned(
                  top: -190,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(pokemon.imageUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      PokemonTypeChips(types: pokemon.types),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/ruler-icon.png', height: 24),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${pokemon.height} m',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Altura',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              color: AppColors.brightBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    width: 20,
                    indent: 8,
                    endIndent: 8,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/scale-icon.png', height: 24),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${pokemon.weight} kg',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Peso',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              color: AppColors.brightBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: PokemonStats(pokemon: pokemon),
          ),
        ],
      ),
    );
  }
}
