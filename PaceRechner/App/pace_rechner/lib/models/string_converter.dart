import 'package:flutter/foundation.dart';

class StringConverter {
  double? ConvertStringToDistanzInKm(String _distanz) {
    if (_distanz.isEmpty) {
      return null;
    }

    _distanz = _distanz.replaceAll(',', '.');
    double? distanzInKm = double.tryParse(_distanz.split(' ')[0]);
    return distanzInKm;
  }

  double? ConvertStringToZeitInMinuten(String _zeit) {
    _zeit = _zeit.replaceAll(',', '.');
    _zeit = _zeit.replaceAll('.', ':');
    _zeit = _zeit.split(' ')[0];
    double? zeitInMinuten = double.tryParse(_zeit.split(' ')[0]);
    return zeitInMinuten;
  }

  double? ConvertStringToPaceInMinutenProKm(String _pace) {
    if (_pace.isEmpty) {
      return null;
    }
    _pace = _pace.replaceAll(',', '.');
    _pace = _pace.replaceAll(':', '.');
    double? timePace = double.tryParse(_pace.split(' ')[0]);
    return timePace;
  }
}
