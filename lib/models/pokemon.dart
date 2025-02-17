class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final double height;
  final double weight;
  final String description;
  final int hp;
  final int attack;
  final int defense;
  final int specialDefense;
  final int speed;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
    required this.description,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialDefense,
    required this.speed,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    try {
      final sprites = json['sprites'] as Map<String, dynamic>;
      final other = sprites['other'] as Map<String, dynamic>?;
      final home = other?['home'] as Map<String, dynamic>?;

      String imageUrl =
          home?['front_default'] ??
          sprites['front_default'] ??
          '';

      final stats = json['stats'] as List;
      final hp = stats[0]['base_stat'] as int;
      final attack = stats[1]['base_stat'] as int;
      final defense = stats[2]['base_stat'] as int;
      final specialDefense = stats[3]['base_stat'] as int;
      final speed = stats[4]['base_stat'] as int;

      final height = (json['height'] as int) / 10.0;
      final weight = (json['weight'] as int) / 10.0;

      String description = 'No description available';

      return Pokemon(
        id: json['id'] as int,
        name: (json['name'] as String).capitalize(),
        imageUrl: imageUrl,
        types:
            (json['types'] as List)
                .map((type) => (type['type']['name'] as String))
                .toList(),
        height: height,
        weight: weight,
        description: description,
        hp: hp,
        attack: attack,
        defense: defense,
        specialDefense: specialDefense,
        speed: speed,
      );
    } catch (e) {
      rethrow;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }
}
