//The pokemon model. For simplicity, here we are modeling just few fileds.
class Pokemon{
  final int id;
  final String name;
  final int height;
  final int weight;
  final String sprite;

  const Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprite,
  });

  //This factory method is used to create a new Pokemon object from a JSON.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprite: json['sprites']['front_default'],
    );
  }//Pokemon.fromJson
  
}//Pokemon