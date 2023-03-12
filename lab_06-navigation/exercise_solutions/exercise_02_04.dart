//Use the fetchUserRole() function developed in 02.09 to create a new function isAdminUser() 
//that checks if the string provided by fetchUserRole() is ‘admin’ and returns the respective boolean.
//Use the new function in the main to produce the following output:
//Checking if user is an admin…
//Ok, access granted! (if the user is an admin)
//Access denied! (if the user is not an admin)

Future<String> fetchUserRole() async {
  return Future.delayed(const Duration(seconds: 3), () => 'admin');
}//fetchUserRole

Future<bool> isAdminUser() async {
  return await fetchUserRole() == 'admin';
}//isAdminUser

Future<void> main() async {

  print('Checking if user is an admin...');

  var res = await isAdminUser();

  res ? print('Ok, access granted!') : print('Access denied!') ;

}//main

