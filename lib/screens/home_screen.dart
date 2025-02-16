import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/pokeicon.png', height: 46),
            SizedBox(width: 16),
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
    );
  }
}
