import 'package:pace_rechner/models/string_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Convert Km String to Double', () {
    final converter = StringConverter();

    var km = converter.ConvertStringToDistanzInKm("21,1");

    expect(km, 21.1);

    var km2 = converter.ConvertStringToDistanzInKm("21,1 km");

    expect(km2, 21.1);

    var km3 = converter.ConvertStringToDistanzInKm("0,5 km");
    
    expect(km3, 0.5);
  });
  test('Convert Zeit String to Double', () {
    final converter = StringConverter();

    var zeit = converter.ConvertStringToZeitInMinuten("120");

    expect(zeit, 120);

    var zeit2 = converter.ConvertStringToZeitInMinuten("120 min");

    expect(zeit2, 120);
  });
  test('Convert Pace String to Double', () {
    final converter = StringConverter();

    var pace = converter.ConvertStringToPaceInMinutenProKm("05:41");

    expect(pace, 5.41);

    var pace2 = converter.ConvertStringToPaceInMinutenProKm("05:41 min/km");

    expect(pace2, 5.41);
  });
}
