import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:provider/provider.dart';

import "/domain_layer/authenticator.dart";

/// Creates a simple button to allow the user to sign in with Google.
/// If the user is signed in, the button instead displays text stating
/// the user's email address.
class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  State createState() => _GoogleSignInButton();
}

class _GoogleSignInButton extends State<GoogleSignInButton> {
  @override
  Widget build(context) {
    var googleAuth = context.watch<GoogleAuth>();

    return FutureBuilder(
      future: googleAuth.isSignedIn(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }

        var isSignedIn = snapshot.data!;
        if (isSignedIn) {
          return Text("Signed in as ${googleAuth.getUser()!.email}");
        }
        
        return ElevatedButton(
            child: const Text("Google Sign In"),
            onPressed: () {
              googleAuth.trySignIn();
            });
      }
    );
  }
}

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
