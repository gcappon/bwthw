import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualize_steps/providers/data_provider.dart';
import 'package:visualize_steps/services/impact.dart';
import 'package:visualize_steps/widgets/line_plot.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DataProvider>(builder: (context, data, child) {
              if (data.stepData.length == 0) {
                return Text('Nothing to display');
              }//if
              else {
                return StepDataPlot(stepData: data.stepData);
              }//else
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await ImpactService.authorize();
                  final message =
                      result == 200 ? 'Request successful' : 'Request failed';
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                },
                child: Text('Authorize app')
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false)
                      .fetchStepData('2023-05-13');
                },
                child: Text('Fetch data')
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<DataProvider>(context, listen: false).clearData();
                },
                child: Text('Clear data')
            ),
          ],
        ),
      ),
    );
  } //build
} //HomePage
