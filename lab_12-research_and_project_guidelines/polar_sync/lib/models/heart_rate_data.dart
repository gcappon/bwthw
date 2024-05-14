class HeartRateData{
  final DateTime time;
  final int value;

  HeartRateData({required this.time, required this.value});

  @override
  String toString() {
    return 'HeartRateData(time: $time, value: $value)';
  }//toString
}//HeartRateData