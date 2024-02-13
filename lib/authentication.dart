import 'package:google_sign_in/google_sign_in.dart';

const List<String> scopes = <String>[
  "email",
  "https://www.googleapis.com/auth/calendar.readonly",
  "https://www.googleapis.com/auth/calendar.events.owned.readonly",
];

GoogleSignIn getGoogleSignIn() {
  return GoogleSignIn(
    clientId: "662521222417-ki0ipll3nnsgsf0eeh82forng7ohognc.apps.googleusercontent.com",
    scopes: scopes,
  );
}
