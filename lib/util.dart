import "dart:io" show Platform;

/// Returns true if the application is currently being tested/is in
/// testing mode. e.g. this will return true during `flutter test` runs.
bool isTesting() {
  return Platform.environment.containsKey("FLUTTER_TEST");
}

/// "Prettifies" a postcode by inserting a space.
String prettifyPostcode(String postcode) {
  if (postcode.length <= 3) {
    return postcode;
  }

  var i = postcode.length - 3;

  return "${postcode.substring(0, i)} ${postcode.substring(i)}";
}
