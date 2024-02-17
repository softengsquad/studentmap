import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";

import "/domain_layer/authenticator.dart";

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
      });
  }

  @override
  Widget build(context) {
    if (_currentUser == null) {
      return ElevatedButton(
        child: const Text("Sign in"),
        onPressed: () {
          trySignIn();
        }
      );
    } else {
      return const Text("Signed in as {_currentUser.email}");
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
