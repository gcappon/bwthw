//This is the general Graphic abstract class which defines the common behaviour 
//of the specialized classes
abstract class Graphic{
  final double height;
  Graphic({required this.height});
  void draw();
}//Graphic

//This class implements the Graphic class. It uses the composite pattern since it is a Graphic
//which is composed by other Graphics
class Container implements Graphic{
  final List<Graphic> components;
  @override
  final double height;
  Container({required this.components, required this.height});

  //The behaviour of draw will be drawing all the Graphic inside components
  void draw(){
    print('Drawing the container, height: $height...');
    for (var item in components) {
      item.draw();
    }//for
    print('Done!');
  }//draw

}//Container

//The behaviour of draw will be drawing all the Graphic inside components
class Text implements Graphic{
  final String text;
  @override
  final double height;
  Text({required this.text, required this.height});

  //The behaviour of draw will be drawing the Text itself
  void draw(){
    print('Drawing the text: \'$text\', height: $height!');
  }//draw

}//Text

class Button implements Graphic{
  @override
  final double height;
  Button({required this.height});

  //The behaviour of draw will be drawing the Text itself
  void draw(){
    print('Drawing the button, height: $height!');
  }//draw
  //Button do also other specialized stuff
  void doSomething(){
    print('Do something when clicked!');
  }//doSomething

}//Button

void main(List<String> args) {
  
  //Let's compose the box
  List<Graphic> boxComponents = [
    Text(text: 'Hello', height: 100),
    Button(height: 50),
  ];
  Graphic box = Container(components: boxComponents, height: 500);

  //Then, let's compose the whole screen
  List<Graphic> screenComponents = [
    box,
    Button(height: 150),
  ];
  Graphic screen = Container(components: screenComponents, height: 1000);

  //Finally, let's draw the screen
  screen.draw();
  
}//main