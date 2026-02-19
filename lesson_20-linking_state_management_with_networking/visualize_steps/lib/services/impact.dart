import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImpactService {

  static String baseUrl = 'https://impact.dei.unipd.it/bwthw/';
  static String pingEndpoint = 'gate/v1/ping/';
  static String tokenEndpoint = 'gate/v1/token/';
  static String refreshEndpoint = 'gate/v1/refresh/';
  
  static String stepsEndpoint = 'data/v1/steps/patients/';

  static String username = '<YOUR_USERNAME>';
  static String password = '<YOUR_PASSWORD>';

  static String patientUsername = 'Jpefaq6m58';

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  static Future<int?> authorize() async {
    //Create the request
    final url = ImpactService.baseUrl + ImpactService.tokenEndpoint;
    final body = {'username': ImpactService.username, 'password': ImpactService.password};

    //Get the response
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If 200, set the token
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
  } //_authorize

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  static Future<int> refreshTokens() async {

    //Create the request
    final url = ImpactService.baseUrl + ImpactService.refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh = sp.getString('refresh');

    final body = {'refresh': refresh};

    //Get the respone
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If 200 set the tokens
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Return just the status code
    return response.statusCode;
  } //_refreshTokens

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  static Future<dynamic> fetchStepData(String day) async {

    //Get the stored access token (Note that this code does not work if the tokens are null)
    final sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    //If access token is expired, refresh it
    if(JwtDecoder.isExpired(access!)){
      await ImpactService.refreshTokens();
      access = sp.getString('access');
    }//if

    //Create the (representative) request
    final url = ImpactService.baseUrl + ImpactService.stepsEndpoint + ImpactService.patientUsername + '/day/$day/';
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    //Get the response
    print('Calling: $url');
    final response = await http.get(Uri.parse(url), headers: headers);
    
    //if OK parse the response, otherwise return null
    var result = null;
    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
    } //if

    //Return the result
    return result;

  } //_requestData

}//ImpactService
