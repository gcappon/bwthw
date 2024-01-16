class Dog{

    // --- Instance variables 
    String? name;
    double? weight;
    String? color;

    // --- Constructors 
    Dog({this.name, this.weight, this.color});
    Dog.withName({this.name});
    Dog.fuffy() : name = 'Fuffy';


    // --- Methods
    void bark(){
      print('Bark!');
    }//bark

    void walk(){
      print("I'm walking!");
    }//walk

    double eat(){
      weight = weight! + 0.1;
      print("I'm eating! I also gained 0.1 kg");
      return weight!;
    }//eat

}//Dog