class Dog{

    // --- Instance variables 
    final String name;
    double weight;
    final String color;

    // --- Constructor 
    Dog({required this.name, required this.weight, required this.color});

    // --- Methods
    void bark(){
      print('Bark!');
    }//bark

    void walk(){
      print("I'm walking!");
    }//walk

    double eat(){
      weight = weight + 0.1;
      print("I'm eating! I also gained 0.1 kg");
      return weight;
    }//eat

}//Dog