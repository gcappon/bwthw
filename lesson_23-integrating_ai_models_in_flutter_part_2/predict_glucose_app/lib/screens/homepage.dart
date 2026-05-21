import 'package:flutter/material.dart';
import 'package:predict_glucose_app/models/glucose_predictor.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _cgmController = TextEditingController();
  final TextEditingController _rocController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Glucose Predictor')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _cgmController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                decoration: InputDecoration(
                  labelText: 'CGM (mg/dL)',
                  hintText: 'e.g. 120.0',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _rocController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                decoration: InputDecoration(
                  labelText: 'ROC (mg/dL/min)',
                  hintText: 'e.g. -0.5',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  // Try parsing the inputs; show error if invalid
                  final double? cgm = double.tryParse(_cgmController.text);
                  final double? roc = double.tryParse(_rocController.text);
                  if (cgm == null || roc == null) {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter valid numbers for CGM and ROC.',
                          ),
                        ),
                      );
                  }// if

                  // If inputs are valid, load the model and make a prediction
                  final GlucosePredictor predictor = GlucosePredictor();
                  await predictor.load();
                  final double prediction = predictor.predict(cgm!, roc!);

                  // Show the prediction in a SnackBar
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(
                          'Predicted glucose in 30 min: ${prediction.toStringAsFixed(1)} mg/dL',
                        ),
                      ),
                    );
                },
                child: const Text('Predict glucose'),
              ),
            ],
          ),
        ),
      ),
    );
  } // build
} // HomePage
