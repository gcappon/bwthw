import 'package:flutter/material.dart';
import 'package:polar_sync/models/heart_rate_data.dart';

class DataProvider extends ChangeNotifier {

  //This serves as database of the application
  List<HeartRateData> heartRateData = [];

  //Method to add heart rate data from Polar
  void addHeartRateData(int value) async {

    final now = DateTime.now();
    heartRateData.add(HeartRateData(time: now, value: value));

    //remember to notify the listeners
    notifyListeners();

  }//addHeartRateData

  //Method to clear the "memory"
  void clearData() {
    heartRateData.clear();
    notifyListeners();
  }//clearData
  
}//DataProvider