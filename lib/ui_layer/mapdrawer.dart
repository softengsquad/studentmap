import "package:flutter/material.dart";
import "/ui_layer/authentication.dart";

class MapDrawer extends StatelessWidget {
  const MapDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          GoogleSignInButton(),
        ],
      ),
    );
  }
}
