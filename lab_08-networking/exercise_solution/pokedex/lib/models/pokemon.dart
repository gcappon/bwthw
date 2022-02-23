class Pokemon{
  final int id;
  final String name;
  final int height;
  final int weight;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }//Pokemon.fromJson
  
}//Pokemon