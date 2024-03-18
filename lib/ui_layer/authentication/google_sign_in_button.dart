import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentmap/ui_layer/authentication/google_auth.dart';

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
        });
  }
}
