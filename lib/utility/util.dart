import "dart:io" show Platform;

/// Returns true if the application is currently being tested/is in
/// testing mode. e.g. this will return true during `flutter test` runs.
bool isTesting() {
  return Platform.environment.containsKey("FLUTTER_TEST");
}
