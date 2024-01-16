void main(List<String> args) {
  
  // --- If-Else
  //The following will print
  //a has 0 value.
  int a = 0;
  if(a == 0){
    print('a has 0 value.');
  } else if(a < 0){
    print('a is negative.');
  } else {
    print('a is positive.');
  }//if-else


  // --- For
  //The following will print
  //1
  //2
  //3
  var list = [1,2,3];
  for (var i = 0; i < list.length; i++) {
    print(list[i]);
  }//for

  //The following will print
  //1
  //2
  //3
  for (var item in list) {
    print(item);
  }//for
  

  // --- While
  //The following will print
  //3
  //2
  //1
  var n = 3;
  while(n>0){
    print(n);
    n--;
  }//while

  
  // --- Do-While 
  //The following will print
  //3
  //2
  //1
  var m = 3;
  do{
    print(m);
    m--;
  }while(m>0);


  // --- Break

  //The following will print
  //5
  //4
  var x = 5;
  while(x>0){
    print(x);
    x--;
    if(x == 3){
      break;
    }//if    
  }//while


  // --- Continue

  //The following will print
  //5
  //3
  //1
  int y = 6;
  while(y>0){
    y--;

    if(y % 2 == 0){
      continue;
    }else{
      print(y);
    }//if-else
    
  }//while


  // --- switch - case 

  //The following will print
  //Open the gate!
  var command = 'OPEN';
  switch (command) {
    case 'OPEN':
      print('Open the gate!');
      break;
    case 'CLOSE':
      print('Close the gate!');
      break;
  }//switch-case

  
  // --- Exceptions, try-catch-finally
  //The following will print
  //Impossible to parse!
  //Try to correct the code.

  String s = 'A string.';
  try{
    var n = int.parse(s);
  } on FormatException catch (e) {
    // Anything else that is an exception
    print('Impossible to parse!');
  } catch (e) {
    // No specified type, handles all other than FormatException
    print('Something really unknown: $e');
  }finally{
    print('Bye!');
  }//try-catch-finally
  
}//main