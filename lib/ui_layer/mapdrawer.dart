import "package:flutter/material.dart";
import "package:googleapis/chat/v1.dart";
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
    final TextEditingController controller = TextEditingController();

    return Drawer(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBarView(
              children: [
                // Building info
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: BuildingInfo(currentBuildingInfo.building),
                ),
                // Search
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(children: [
                      TextField(
                        controller: controller,
                        decoration:
                            const InputDecoration(labelText: "Search for a building"),
                      ),
                      ElevatedButton(
                        onPressed: () {print(controller.text);},
                        child: const Text("Search"),
                      ),
                    ])),

                // Calendar
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
