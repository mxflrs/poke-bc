import 'package:flutter/material.dart';
import 'package:test1/models/pokemon.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display Pokémon details
            Text('ID: ${pokemon.id}'),
            Text('Name: ${pokemon.name}'),
            if (pokemon.imageUrl.isNotEmpty) Image.network(pokemon.imageUrl),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
