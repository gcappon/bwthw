import 'package:intl/intl.dart';

class StepData{
  final DateTime time;
  final int value;

  StepData({required this.time, required this.value});

  StepData.fromJson(String date, Map<String, dynamic> json) :
      time = DateFormat('yyyy-MM-dd HH:mm:ss').parse('$date ${json["time"]}'),
      value = int.parse(json["value"]);

  @override
  String toString() {
    return 'StepData(time: $time, value: $value)';
  }//toString
}//Steps