import "package:flutter/material.dart";
import "/ui_layer/authentication.dart";
import "/ui_layer/buildinginfo.dart";

class MapDrawer extends StatefulWidget {
  const MapDrawer({super.key});

  @override
  State<MapDrawer> createState() => _MapDrawer();
}

class _MapDrawer extends State<MapDrawer> {
  BuildingInfo? buildingInfo;

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
