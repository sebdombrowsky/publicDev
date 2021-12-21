import 'package:pace_rechner/models/string_converter.dart';

class Sprueche {
  String GetSpruch(String _pace) {
    StringConverter converter = StringConverter();
    double? paceInMinuten = converter.ConvertStringToPaceInMinutenProKm(_pace);
    
    if (paceInMinuten != null) {
      double? pace = (paceInMinuten / 60);
      if (pace < 2.5) {
        return "Kipchoge ist stolz!";
      }
      if (pace >= 2.5 && pace < 3) {
        return "Olympia calling!";
      }
      if (pace >= 3 && pace < 3.5) {
        return "Run Forrest, run!";
      }
      if (pace >= 3.5 && pace < 4) {
        return "Gleich hebst du ab!";
      }
      if (pace >= 4 && pace < 4.5) {
        return "Du Rakete!";
      }
      if (pace >= 4.5 && pace < 5.5) {
        return "Läuft bei dir!";
      }
      if (pace >= 5.5 && pace < 6) {
        return "Flotte Biene!";
      }
      if (pace >= 6 && pace < 6.5) {
        return "Du motivierst!";
      }
      if (pace >= 6.5 && pace < 7) {
        return "Du bist im Flow!";
      }
      if (pace >= 7 && pace < 7.5) {
        return "Schritt für Schritt!";
      }
      if (pace >= 7.5 && pace < 8) {
        return "Challenge accepted!";
      }
      if (pace >= 8) {
        return "I'm walking on sunshine!";
      }
    }
    return "";
  }
}
