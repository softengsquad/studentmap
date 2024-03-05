import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "/ui_layer/authentication.dart";
import "/ui_layer/buildinginfo.dart";

// TODO: Documentation

class MapDrawer extends StatelessWidget {
  const MapDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var currentBuildingInfo = context.watch<CurrentBuildingInfo>();

    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: SizedBox(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: GoogleSignInButton(),
          ),
          BuildingInfo(currentBuildingInfo.building),
        ],
      ),
    );
  }
}
