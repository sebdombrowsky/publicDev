import 'package:pace_rechner/models/string_converter.dart';

class Rechner {
  StringConverter converter = StringConverter();

  String PaceBerechnen(String _distanz, String _zeit) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);

    String paceInKmProMin = "";

    if (distanzInKm != null && zeitInMinuten != null) {
      paceInKmProMin = (zeitInMinuten / distanzInKm).toString().split('.')[0] +
          ":" +
          (((zeitInMinuten / distanzInKm) * 60) % 60).toStringAsFixed(0);
    }
    return paceInKmProMin;
  }

  String DistanzBerechnen(String _zeit, String _pace) {
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);
    double? paceInSekunden = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String distanzInKm = "";

    if (zeitInMinuten != null && paceInSekunden != null) {
      distanzInKm =
          ((zeitInMinuten * 60) / paceInSekunden).toString().split('.')[0] +
              "." +
              ((((zeitInMinuten * 60) / paceInSekunden) * 60) % 60)
                  .toStringAsFixed(0);
    }
    return distanzInKm;
  }

  String ZeitBerechnen(String _distanz, String _pace) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? paceInSekunden = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String zeitInStunden = "";

    if (distanzInKm != null && paceInSekunden != null) {
      zeitInStunden =
          (((distanzInKm * paceInSekunden) / 60) / 60).toString().split('.')[0] +
              ":" +
              (((distanzInKm * paceInSekunden) / 60) % 60).toString().split('.')[0];
    }
    return zeitInStunden;
  }
}
