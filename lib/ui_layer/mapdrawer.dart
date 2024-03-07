import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "/ui_layer/authentication.dart";
import "/ui_layer/buildinginfo.dart";

/// The drawer interface that appears at the left side of the screen.
///
/// Displays various information such as the [GoogleSignInButton] and
/// current [BuildingInfo].
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
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          BuildingInfo(currentBuildingInfo.building),
        ],
      ),
    );
  }
}
