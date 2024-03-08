import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

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
  GoogleSignInAccount? _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: getClientId(),
    scopes: getScopes(),
  );

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? user) async {
      setState(() {
        _currentUser = user;
      });

      if (user == null) {
        return;
      }

      var httpClient = (await _googleSignIn.authenticatedClient())!;
    });
  }

  @override
  Widget build(context) {
    if (_currentUser == null) {
      return ElevatedButton(
          child: const Text("Google Sign In"),
          onPressed: () {
            trySignIn();
          });
    } else {
      return Text("Signed in as ${_currentUser!.email}");
    }
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
}
