import 'package:pace_rechner/models/string_converter.dart';

class Rechner {
  StringConverter converter = StringConverter();

  String PaceBerechnen(String _distanz, String _zeit) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);

    String paceInKmProMin = "05:40";
    if (distanzInKm != null && zeitInMinuten != null) {
      var nachKommaStelle = (((zeitInMinuten / distanzInKm) * 60) % 60)
          .toStringAsFixed(1)
          .split('.')[0];
      paceInKmProMin = (zeitInMinuten / distanzInKm).toString().split('.')[0] +
          ":" +
          (nachKommaStelle.length == 1
              ? "0" + nachKommaStelle
              : nachKommaStelle);
    }
    return paceInKmProMin;
  }

  String DistanzBerechnen(String _zeit, String _pace) {
    double? zeitInMinuten = converter.ConvertStringToZeitInMinuten(_zeit);
    double? paceInSekunden = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String distanzInKm = "";
    if (zeitInMinuten != null && paceInSekunden != null) {
      var nachkommaStelle = (((zeitInMinuten * 60) / paceInSekunden) % 100).toStringAsFixed(2).split('.')[1];
      distanzInKm = ((zeitInMinuten * 60) / paceInSekunden).toString().split('.')[0] + "." + nachkommaStelle;
    }
    return distanzInKm;
  }

  String ZeitBerechnen(String _distanz, String _pace) {
    double? distanzInKm = converter.ConvertStringToDistanzInKm(_distanz);
    double? paceInSekunden = converter.ConvertStringToPaceInMinutenProKm(_pace);

    String zeitInStunden = "";

    if (distanzInKm != null && paceInSekunden != null) {
      var nachKommaStelle = (((distanzInKm * paceInSekunden) / 60) % 60)
          .toStringAsFixed(1)
          .split('.')[0];
      zeitInStunden = (((distanzInKm * paceInSekunden) / 60) / 60)
              .toString()
              .split('.')[0] +
          ":" +
          (nachKommaStelle.length == 1
              ? "0" + nachKommaStelle
              : nachKommaStelle);
    }
    return zeitInStunden;
  }
}
