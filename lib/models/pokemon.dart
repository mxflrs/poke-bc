class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    try {
      // Safely navigate through the nested JSON structure
      final sprites = json['sprites'] as Map<String, dynamic>;
      final other = sprites['other'] as Map<String, dynamic>?;
      final home = other?['home'] as Map<String, dynamic>?;

      // Provide a fallback URL if the preferred image is null
      String imageUrl =
          home?['front_default'] ?? // First try home
          sprites['front_default'] ?? // Then try regular sprite
          ''; // Empty string as last resort

      return Pokemon(
        id: json['id'] as int,
        name: (json['name'] as String).capitalize(),
        imageUrl: imageUrl,
        types:
            (json['types'] as List)
                .map((type) => (type['type']['name'] as String))
                .toList(),
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
