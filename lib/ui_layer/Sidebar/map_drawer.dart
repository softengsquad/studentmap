import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:studentmap/domain_layer/building_manager/building_manager.dart";
import "package:studentmap/ui_layer/sidebar/tabs/building_info_tab.dart";
import "package:studentmap/ui_layer/sidebar/tabs/calendar_tab.dart";
import "package:studentmap/ui_layer/sidebar/tabs/search_tab.dart";
import "../widgets/buildinginfo.dart";

/// The drawer interface that appears at the left side of the screen.
///
/// Displays various information such as the [GoogleSignInButton] and
/// current [BuildingInfo].
// ignore: must_be_immutable
class MapDrawer extends StatelessWidget {
  MapDrawer(this.manager, {super.key});

  BuildingManager manager;

  @override
  Widget build(BuildContext context) {
    var currentBuildingInfo = context.watch<CurrentBuildingInfo>();
    final TextEditingController controller = TextEditingController();

    return Drawer(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              children: [
                // Building Info Tab
                BuildingInfoTab(currentBuildingInfo),
                // Search Tab
                SearchTab(controller, manager),
                // Calendar Tab
                const CalendarTab()
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
