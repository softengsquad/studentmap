import "package:flutter/material.dart";
import "/domain_layer/building_manager/building.dart";
import "/ui_layer/authentication.dart";
import "/ui_layer/buildinginfo.dart";

// TODO: Documentation

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
          buildingInfo != null ? buildingInfo! : const SizedBox.shrink(),
        ],
      ),
    );
  }

  void setBuildingInfo(Building building) {
    setState(() {
      buildingInfo = BuildingInfo(building);
    });
  }
}
