import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/screens/detail_screen.dart';
import 'package:test1/theme/app_colors.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child:
                        pokemon.imageUrl.isNotEmpty
                            ? SizedBox(
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl: pokemon.imageUrl,
                                fit: BoxFit.contain,
                                placeholder:
                                    (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                errorWidget:
                                    (context, url, error) =>
                                        const Icon(Icons.catching_pokemon),
                              ),
                            )
                            : const Icon(Icons.catching_pokemon, size: 80),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: GoogleFonts.montserrat(
                        color: AppColors.off,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                pokemon.name,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
