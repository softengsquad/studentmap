import "package:flutter/material.dart";
import "/ui_layer/authentication.dart";

class MapDrawer extends StatelessWidget {
  const MapDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: GoogleSignInButton(),
          ),
        ],
      ),
    );
  }
}
