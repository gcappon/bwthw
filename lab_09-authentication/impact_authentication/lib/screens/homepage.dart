import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:impact_authentication/utils/impact.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const routename = 'HomePage';

  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');

    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final result = await _isImpactUp();
                  final message = result
                      ? 'IMPACT backend is up!'
                      : 'IMPACT backend is down!';
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Ping IMPACT')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await _getAndStoreTokens();
                  final message =
                      result == 200 ? 'Request successful' : 'Request failed';
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Get tokens')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final sp = await SharedPreferences.getInstance();
                  final access = await sp.getString('access');
                  final refresh = await sp.getString('refresh');
                  final message = access == null
                      ? 'No stored tokens'
                      : 'access: $access; refresh: $refresh';
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Print tokens')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final sp = await SharedPreferences.getInstance();
                  final refresh = await sp.getString('refresh');
                  final message;
                  if (refresh == null) {
                    message = 'No stored tokens';
                  } else {
                    final result = await _refreshTokens();
                    message =
                        result == 200 ? 'Request successful' : 'Request failed';
                  } //if-else
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Refresh tokens')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final sp = await SharedPreferences.getInstance();
                  await sp.remove('access');
                  await sp.remove('refresh');
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text('Tokens have been deleted')));
                },
                child: Text('Delete tokens')),
          ],
        ),
      ),
    );
  } //build

  //This method allows to check if the IMPACT backend is up
  Future<bool> _isImpactUp() async {
    final url = Impact.baseUrl + Impact.pingEndpoint;
    final response = await http.get(Uri.parse(url));
    return response.statusCode == 200;
  } //_isImpactUp

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  Future<int> _getAndStoreTokens() async {
    final url = Impact.baseUrl + Impact.tokenEndpoint;
    final body = {'username': Impact.username, 'password': Impact.password};
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if
    return response.statusCode;
  } //_getAndStoreTokens

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  Future<int> _refreshTokens() async {
    final url = Impact.baseUrl + Impact.refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh = await sp.getString('refresh');
    final body = {'refresh': refresh};
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if
    return response.statusCode;
  } //_refreshTokens
} //HomePage
