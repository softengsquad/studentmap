import 'package:google_sign_in/google_sign_in.dart';

import "/domain_layer/authenticator.dart";

/// Opens the Google sign-in widget using the predefined client id and
/// access scopes.
GoogleSignIn getGoogleSignIn() {
  return GoogleSignIn(
    clientId: getClientId(),
    scopes: getScopes(),
  );
}
