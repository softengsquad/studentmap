import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/util.dart';

void main() {
  group("Util tests |", () {
    test("Prettify 5 letter postcode", () async {
      expect(prettifyPostcode("A99AA"), "A9 9AA");
    });

    test("Prettify 6 letter postcode", () async {
      expect(prettifyPostcode("A999AA"), "A99 9AA");
    });

    test("Prettify 7 letter postcode", () async {
      expect(prettifyPostcode("AA9A9AA"), "AA9A 9AA");
    });

    // Not a valid postcode so should do nothing.
    test("Prettify 3 letter postcode", () async {
      expect(prettifyPostcode("A9A"), "A9A");
    });

    test("Prettify lowercase postcode", () async {
      expect(prettifyPostcode("aa9a9aA"), "AA9A 9AA");
    });
  });
}
