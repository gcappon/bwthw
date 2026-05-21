import 'dart:convert';
import 'package:flutter/services.dart';

/// Loads and runs the exported StandardScaler + LinearRegression model
/// stored in assets/cgm_forecast.json.
///
/// Prediction formula (mirrors sklearn's pipeline):
///   x_scaled[i] = (x[i] - mean[i]) / scale[i]
///   y = coef[0]*x_scaled[0] + coef[1]*x_scaled[1] + intercept
class GlucosePredictor {
  late List<double> _mean;
  late List<double> _scale;
  late List<double> _coef;
  late double _intercept;

  /// Load model parameters from the bundled JSON asset.
  Future<void> load() async {
    final String raw =
        await rootBundle.loadString('assets/cgm_forecast.json');
    final Map<String, dynamic> json = jsonDecode(raw);

    _mean = List<double>.from(json['mean']);
    _scale = List<double>.from(json['scale']);
    _coef = List<double>.from(json['coef']);
    _intercept = (json['intercept'] as num).toDouble();
  } // load

  /// Predict the glucose value 30 minutes ahead.
  ///
  /// [cgm]  – current CGM reading (mg/dL)
  /// [roc]  – rate-of-change over the last 15 min (mg/dL/min)
  ///
  /// Returns the predicted glucose value in mg/dL.
  double predict(double cgm, double roc) {

    final double cgmScaled = (cgm - _mean[0]) / _scale[0];
    final double rocScaled = (roc - _mean[1]) / _scale[1];

    return _coef[0] * cgmScaled + _coef[1] * rocScaled + _intercept;
  } // predict
  
}// GlucosePredictor
