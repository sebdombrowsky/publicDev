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
    double? stunden = double.tryParse(_zeit.split(':')[0]);
    double? minuten = double.tryParse(_zeit.split(':')[1]);
    if (stunden != null && minuten != null) {
      double zeitInMinuten = (stunden * 60) + minuten;
      return zeitInMinuten;
    }
    return null;
  }

  double? ConvertStringToPaceInMinutenProKm(String _pace) {
    double? minuten = double.tryParse(_pace.split(':')[0]);
    double? sekunden = double.tryParse(_pace.split(':')[1]);

    if (minuten != null && sekunden != null) {
      double zeitInSekunden = (minuten * 60) + sekunden;
      return zeitInSekunden;
    }
    return null;
  }
}
