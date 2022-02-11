import 'package:flutter/material.dart';
import 'package:login_flow/screens/homePage.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  Future<String> _loginUser(LoginData data) async {
    if(data.name == 'bug@expert.com' && data.password == '5TrNgP5Wd'){
      return '';
    } else {
      return 'Wrong credentials';
    }
  } // _loginUser

  Future<String> _signUpUser(SignupData data) async {
    return 'To be implemented';
  } // _signUpUser

  Future<String> _recoverPassword(String email) async {
    return 'Recover password functionality needs to be implemented';
  } // _recoverPassword

  @override
  Widget build(BuildContext context) {
    
    return FlutterLogin(
      title: 'login_flow',
      onLogin: _loginUser,
      onSignup: _signUpUser,
      onRecoverPassword: _recoverPassword,
      onSubmitAnimationCompleted: () async{
        Navigator.of(context).pushReplacementNamed(HomePage.route);
      },
    );
  } // build
} // LoginScreen
