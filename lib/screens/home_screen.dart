import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/pokemon_provider.dart';
import 'package:test1/theme/app_colors.dart';
import 'package:test1/widgets/pokemon_grid.dart';
import 'package:test1/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonProvider>().loadPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = context.watch<PokemonProvider>().isSearchActive;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/pokeicon.png', height: 46),
            const SizedBox(width: 16),
            Text(
              'Pokédex',
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: AppColors.brightBlue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 30,
              bottom: 0,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "¡Hola, ",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: "bienvenido!",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const CustomSearchBar(),
          const SizedBox(),
          if (isSearching)
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 0, top: 12),
              child: Text(
                'Resultado de búsqueda',
                style: GoogleFonts.montserrat(
                  color: AppColors.off,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          const SizedBox(height: 8),
          Expanded(child: PokemonGrid()),
        ],
      ),
    );
  }
}
