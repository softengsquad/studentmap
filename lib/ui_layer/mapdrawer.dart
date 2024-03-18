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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: BuildingInfo(currentBuildingInfo.building),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                    ])),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                      GoogleSignInButton(),
                      Calendar(),
                    ])),
              ],
            ),
          ),
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.house)),
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.calendar_month))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
