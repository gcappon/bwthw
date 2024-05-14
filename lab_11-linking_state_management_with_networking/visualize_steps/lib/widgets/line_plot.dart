import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:visualize_steps/models/stepdata.dart';

/// Local import

///Renders default line series chart
class StepDataPlot extends StatelessWidget {
  ///Creates default line series chart
  StepDataPlot({Key? key, required this.stepData}) : super(key: key);

  final List<StepData> stepData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: 'Yesterday steps'),
      primaryXAxis: const DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value} steps',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getStepDataSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<StepData, DateTime>> _getStepDataSeries() {
    return <LineSeries<StepData, DateTime>>[
      LineSeries<StepData, DateTime>(
          dataSource: stepData,
          xValueMapper: (data, _) => data.time,
          yValueMapper: (data, _) => data.value,
          name: 'Steps',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }//_getStepDataSeries

}//StepDataPlot