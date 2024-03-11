import "package:flutter/material.dart";
import "/ui_layer/authentication.dart";
import "/ui_layer/calendar.dart";

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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: GoogleSignInButton(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                Calendar(),
              ]))
        ],
      ),
    );
  }
}
