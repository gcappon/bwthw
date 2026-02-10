//Write a function that given a string provided by the main function, 
//returns a boolean that is true if the string is palindrome. 
//Then print the result in the main function.

//Function that checks if a given string is palindrome
bool isPalindrome(String str){

  //Initialize the return value to true
  bool flag = true;

  //Run a for loop that, once it finds two opposite different characters, 
  //sets the return value to false
  for (var i = 0; i < str.length~/2; i++) {
    if(str[i] != str[str.length-1-i]){
      flag = false;
      //Optional: use break to avoid unnecesary iterations.
      break;
    }//if
  }//for
  
  return flag;

}//isPalindrome

void main(List<String> args) {

  //Set the string to be checked and print the result
  String str = 'anna';
  print(isPalindrome(str)); //This is true

  str = 'hello';
  print(isPalindrome(str)); //Thisis false
  
}//main