import 'package:pace_rechner/models/string_converter.dart';

class Sprueche {
  String GetSpruch(String _pace) {
    StringConverter converter = StringConverter();
    double? paceInMinuten = converter.ConvertStringToPaceInMinutenProKm(_pace);
    if (paceInMinuten != null) {
      double? pace = (paceInMinuten / 60);
      if (pace >= 5 && pace < 6) {
        return "Läuft bei dir!";
      }
      if (pace < 5 && pace > 4.5) {
        return "Flott unterwegs!";
      }
      if (pace <= 4.5) {
        return "Du Rakete!";
      }
      if (pace > 6 && pace < 7) {
        return "Du bist im Flow!";
      }
      if (pace > 7 && pace < 8) {
        return "Schritt für Schritt!";
      }
      if (pace > 8) {
        return "I am walking on sunshine!";
      }
    }
    return "";
  }
}
