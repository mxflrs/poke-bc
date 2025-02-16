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

  factory Pokemon.fromJason(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      types:
          (json['types'] as List)
              .map((type) => type['type']['name'] as String)
              .toList(),
    );
  }
}
