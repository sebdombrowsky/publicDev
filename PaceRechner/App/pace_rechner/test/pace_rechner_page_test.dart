import 'package:pace_rechner/models/rechner.dart';
import 'package:test/test.dart';

void main() {
  test('Berechne Pace von 22 km in 02:15', () {
    final Rechner rechner = Rechner();

    var pace = rechner.PaceBerechnen("22", "02:15");

    expect(pace, "6:08");
  });

  test('Berechne Pace von 21.0975 km in 1:59', () {
    final Rechner rechner = Rechner();

    var pace = rechner.PaceBerechnen("21.0975", "01:59");

    expect(pace, "5:38");
  });

  test('Berechne Distanz von 2:15 h in 6:08', () {
    final Rechner rechner = Rechner();

    var km = rechner.DistanzBerechnen("02:15", "6:08");

    expect(km, "22.0");
  });

  test('Berechne Zeit von 22 km in 6:08', () {
    final Rechner rechner = Rechner();

    var zeit = rechner.ZeitBerechnen("22", "6:08");

    expect(zeit, "2:14");
  });

  test('Berechne Zeit von 21.1 km in 6:08', () {
    final Rechner rechner = Rechner();

    var zeit = rechner.ZeitBerechnen("21.1", "6:08");

    expect(zeit, "2:09");
  });

  test('Berechne Distanz von 2:14 h in 6:08', () {
    final Rechner rechner = Rechner();

    var km = rechner.DistanzBerechnen("02:14", "6:08");

    expect(km, "22.0");
  });

  test('Berechne Zeit von 21.5 km in 6:08', () {
    final Rechner rechner = Rechner();

    var zeit = rechner.ZeitBerechnen("21.5", "6:08");

    expect(zeit, "2:11");
  });
}
