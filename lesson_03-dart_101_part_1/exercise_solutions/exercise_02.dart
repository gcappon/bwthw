//In the main function, given an integer number n, instantiate a list of n random integers, 
//with possible maximum value 10. Then, for each element of the list, print it multiplied by 2.

import 'dart:math';

void main(List<String> args) {

  //Instantiate a random number generator (set seed to 1 to generate the same numbers every time)
  var rng = new Random(1);

  //Set the number n
  int n = 5;

  //Instantiate an empty list
  List<int> list = [];

  //Add n integer values to the list
  for (var i = 0; i < n; i++) {
    list.add(rng.nextInt(100));
  }//for

  //Print each element of the list multiplied by 2
  for (var i = 0; i < list.length; i++) {
    print(list[i]*2);
  }//for

}//main