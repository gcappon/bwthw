//Given a number n > 0, print the first n numbers of the Fibonacci series. Bonus: do it recursively.

//Function that returns a list with the first n numbers of the Fibonacci series (recursive version)
List<int> fibonacci(int n){

  //If n = 0, return a list with just a 0
  if(n == 0){
    return [0];
  }//if
  //If n = 1, return a list with just a 1
  if(n == 1){
    return [1];
  }//if

  //Get the fibonacci series of n - 1
  var fib1 = fibonacci(n-1);
  //Get the fibonacci series of n - 2
  var fib2 = fibonacci(n-2);

  //Add to the first list the sum of its last value and 
  //the last value of the second list 
  fib1.add(fib2[fib2.length-1]+fib1[fib1.length-1]);

  //return the first list
  return fib1;

}//fibonacci

void main(List<String> args) {
  
  //Set the value of n
  int n = 10;

  //Get the list of values
  final fib = fibonacci(n);

  //Print the list of values
  print(fib);
  
}//main