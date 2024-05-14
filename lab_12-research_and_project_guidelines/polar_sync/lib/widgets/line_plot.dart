import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:polar_sync/models/heart_rate_data.dart';

/// Local import

///Renders default line series chart
class HeartRateDataPlot extends StatelessWidget {
  ///Creates default line series chart
  HeartRateDataPlot({Key? key, required this.heartRateData}) : super(key: key);

  final List<HeartRateData> heartRateData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'HR'),
      primaryXAxis: DateTimeAxis(
        majorGridLines: MajorGridLines(width: 0),
        dateFormat: DateFormat.Hms(),
        ),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value} BPM',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getHeartRateDataSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<HeartRateData, DateTime>> _getHeartRateDataSeries() {
    return <LineSeries<HeartRateData, DateTime>>[
      LineSeries<HeartRateData, DateTime>(
          dataSource: heartRateData,
          xValueMapper: (data, _) => data.time,
          yValueMapper: (data, _) => data.value,
          name: 'Steps',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }//_getHeartRateDataSeries

}//HeartRateDataPlot