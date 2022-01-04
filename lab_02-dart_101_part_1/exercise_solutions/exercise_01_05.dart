//Given an integer, n, perform the following conditional actions:
//If n is odd, print ’Odd’
//If n is even and in the inclusive range of 2 to 5, print ’Small even’
//If n is even and in the inclusive range of 6 to 20, print ’Medium even’
//If n is even and greater than 20, print ’Big even’
//Otherwise print 'Dont't know'

void main(List<String> args) {

  //Set the value of n
  int n = 20;

  //Perform the checks and print the correct message
  if(n%2 == 1){
    print('Odd');
  }else if(n >= 2 && n <= 5){
    print('Small even');
  }else if(n >=6 && n <= 20){
    print('Medium even');
  }else if(n > 20){
    print('Big even');
  }else{
    print('Don\'t know');
  }//if-else

}//main