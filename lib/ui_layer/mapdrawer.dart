import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "/ui_layer/authentication.dart";
import "/ui_layer/buildinginfo.dart";
import "/ui_layer/calendar.dart";

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: GoogleSignInButton(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                BuildingInfo(currentBuildingInfo.building),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                Calendar(),
              ]
            )
          )
        ],
      ),
    );
  }
}
