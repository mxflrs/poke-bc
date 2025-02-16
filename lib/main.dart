import 'package:flutter/material.dart';
import 'package:test1/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {'/home': (context) => const HomeScreen()},
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PokemonProvider(),
//       child: MaterialApp(
//         title: 'Pokédex',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
//         ),
//         home: const HomeScreen(),
//       ),
//     );
//   }
// }

