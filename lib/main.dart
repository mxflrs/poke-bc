import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/pokemon_provider.dart';
import 'package:test1/screens/home_screen.dart';
import 'package:test1/theme/text_styles.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokemonProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.buttonText,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        // '/details': (context) => const DetailScreen(),
      },
    );
  }
}
