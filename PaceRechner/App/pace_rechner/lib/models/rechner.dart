import 'package:pace_rechner/models/string_converter.dart';

class Rechner {
  StringConverter converter = StringConverter();

  String PaceBerechnen(String _distanz, String _zeit) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);

    String paceInKmProMin = "";

    if (distanzInKm != null && zeitInMinuten != null) {
      var decimalPace = zeitInMinuten / distanzInKm;
      var ganzeZahlString = decimalPace.toString().split('.')[0];
      var nachKommaStellenString = "0." + decimalPace.toString().split('.')[1];
      var echtePaceNachKommaStelle =
          "0." + (double.parse(nachKommaStellenString) * 60).toStringAsFixed(0);
      double echtePace = double.parse(ganzeZahlString) +
          double.parse(echtePaceNachKommaStelle);
      paceInKmProMin = echtePace.toStringAsFixed(2);
    }

    return paceInKmProMin.replaceAll('.', ':') + " min/km";
  }

  String DistanzBerechnen(String _zeit, String _pace) {
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);
    double? timePace = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String distanzInKm = "";

    if (zeitInMinuten != null && timePace != null) {
      var decimalPaceNachkommastelleString = timePace.toString().split('.')[1];
      if (decimalPaceNachkommastelleString.length == 1) {
        decimalPaceNachkommastelleString =
            decimalPaceNachkommastelleString + "0";
      }
      var decimalPaceNachkommastelle =
          double.parse(decimalPaceNachkommastelleString) / 60;
      var decimalPaceDouble = double.parse(timePace.toStringAsFixed(0)) +
          decimalPaceNachkommastelle;
      distanzInKm = (zeitInMinuten / decimalPaceDouble).toStringAsFixed(2);
    }

    return distanzInKm + " km";
  }

  String ZeitBerechnen(String _distanz, String _pace) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? timePace = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String zeitInMinuten = "";

    if (distanzInKm != null && timePace != null) {
      var decimalPaceNachkommastelleString = timePace.toString().split('.')[1];
      if (decimalPaceNachkommastelleString.length == 1) {
        decimalPaceNachkommastelleString =
            decimalPaceNachkommastelleString + "0";
      }
      var decimalPaceNachkommastelle =
          double.parse(decimalPaceNachkommastelleString) / 60;
      var decimalPaceDouble = double.parse(timePace.toStringAsFixed(0)) +
          decimalPaceNachkommastelle;
      zeitInMinuten = (distanzInKm * decimalPaceDouble).toStringAsFixed(0);
    }

    return zeitInMinuten + " min";
  }
}
