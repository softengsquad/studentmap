import 'package:google_sign_in/google_sign_in.dart';

/// The OAuth 2.0 Client ID given by Google Cloud.
const String clientId = "662521222417-ki0ipll3nnsgsf0eeh82forng7ohognc.apps.googleusercontent.com";

/// The list of scopes that will be granted to the application
/// once the user authenticates with Google. This must align with
/// the scopes defined in the OAuth settings in the Google Cloud API Console.
const List<String> scopes = <String>[
  "email",
  "https://www.googleapis.com/auth/calendar.readonly",
  "https://www.googleapis.com/auth/calendar.events.owned.readonly",
];

GoogleSignIn getGoogleSignIn() {
  return GoogleSignIn(
    clientId: clientId,
    scopes: scopes,
  );
}
