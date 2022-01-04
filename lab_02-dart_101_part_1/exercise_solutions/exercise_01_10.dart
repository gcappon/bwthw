//Write a function that given a string provided by the main function containing 
//brackets [], braces {}, parentheses (), or any combination thereof that follows the 
//math expression rules, returns a boolean that is true if any and all pairs are matched and nested correctly. 
//Then print the result in the main function.
//Example: 
//This is ok: {this[is(o)]}k
//This is not ok: T{hi[(sis)not}ok]
//This is not ok: {{this[is(notok)]}}

//Function that check the parentheses
bool checkParentheses(String str){

  //Initialize the return value to true
  bool ret = true;

  //Set a flag for each type of parenthesis.
  //A flag is false if the parenthesis is not open
  bool flagBrackets = false;
  bool flagBraces = false;
  bool flagPar = false;

  //Set a counter for each type of parenthesis.
  int countBrackets = 0;
  int countBraces = 0;
  int countPar = 0;

  //For each character check the criteria
  for (var i = 0; i < str.length; i++) {

    // --- Open parentheses checks

    //If the current character is '{', and braces, brackets, and parentheses are not open 
    //and braces have not been opened yet
    if(str[i]=='{'){
      if(!flagBraces && !flagBrackets && !flagPar && countBraces == 0){
        //Open the braces
        flagBraces = true;
        print('Open {');
      }else{
        ret = false;
        break;
      }//if-else
    }//if

    //If the current character is '[', and brackets and parentheses are not open 
    //and brackets have not been opened yet
    if(str[i]=='['){
      if(!flagBrackets && !flagPar && countBrackets == 0){
        //Open the brackets
        flagBrackets = true;
        print('Open [');
      }else{
        ret = false;
        break;
      }//if-else 
    }//if

    //If the current character is '(', and parentheses are not open 
    //and parentheses have not been opened yet
    if(str[i]=='('){
      if(!flagPar && countPar == 0){
        //Open the parentheses
        flagPar = true;
        print('Open (');
      }else{
        ret = false;
        break;
      }//if-else 
    }//if

    // --- Close parentheses checks

    //If the current character is '}', and braces are open
    if(str[i]=='}'){
      if(flagBraces){
        //Close the braces
        flagBraces = false;
        countBraces++;
        print('Close }');
      }else{
        ret = false;
        break;
      }//if-else
    }//if

    //If the current character is ']' and brackets are open, and braces have not been closed
    if(str[i]==']'){
      if(flagBrackets && countBraces == 0){
        //Close the brackets
        flagBrackets = false;
        countBrackets++;
        print('Close ]');
      }else{
        ret = false;
        break;
      }//if-else
    }//if

    //If the current character is ')' and parentheses are open, and braces and bracket have not been closed
    if(str[i]==')'){
      if(flagPar && countBraces == 0 && countBrackets == 0){
        //Close the parentheses
        flagPar = false;
        countPar++;
        print('Close )');
      }else{
        ret = false;
        break;
      }//if-else
    }//if
  }//for
  
  //Return the result
  return ret;
}
void main(List<String> args) {
  
  //Set the string to be checked
  String str = '{this[is(o)]}k';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));
  
  //Another example
  str = 'T{hi[(sis)not}ok]';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));

  //Another example
  str = '{{this[is(notok)]}}';

  //Get and print the results
  print('Checking ' + str);
  print(checkParentheses(str));

}//main