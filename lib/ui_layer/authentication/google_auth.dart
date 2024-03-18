import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:studentmap/domain_layer/authenticator.dart';

/// Holds the user's Google authentication data if signed in.
///
/// Will notify listeners when the currently signed in user changes.
class GoogleAuth extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: getClientId(),
    scopes: getScopes(),
  );

  GoogleAuth() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? user) {
      notifyListeners();
    });
  }

  /// Returns the current user or null if not signed in.
  GoogleSignInAccount? getUser() {
    return _googleSignIn.currentUser;
  }

  /// Opens the Google sign-in widget and attempts to authenticate
  /// the user.
  Future<GoogleSignInAccount?> trySignIn() async {
    try {
      return _googleSignIn.signIn();
    } catch (error) {
      return null;
    }
  }

  // Returns true if the user is currently signed into Google and authenticated
  // with the app.
  Future<bool> isSignedIn() async {
    return await _googleSignIn.isSignedIn() && getUser() != null;
  }

  /// Returns null if the user is not authenticated.
  Future<AuthClient?> getHttpClient() async {
    return _googleSignIn.authenticatedClient();
  }
}