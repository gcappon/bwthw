import 'package:flutter/material.dart';
import 'package:visualize_steps/models/stepdata.dart';
import 'package:visualize_steps/services/impact.dart';

class DataProvider extends ChangeNotifier {

  //This serves as database of the application
  List<StepData> stepData = [];

  //Method to fetch step data from the server
  void fetchStepData(String day) async {

    //Get the response
    final data = await ImpactService.fetchStepData(day);

    //if OK parse the response adding all the elements to the list, otherwise do nothing
    if (data != null) {
      for (var i = 0; i < data['data']['data'].length; i++) {
        stepData.add(
            StepData.fromJson(data['data']['date'], data['data']['data'][i]));
      } //for

      //remember to notify the listeners
      notifyListeners();
    }//if

  }//fetchStepData

  //Method to clear the "memory"
  void clearData() {
    stepData.clear();
    notifyListeners();
  }//clearData
  
}//DataProvider