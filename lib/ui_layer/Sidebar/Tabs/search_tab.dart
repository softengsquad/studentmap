import 'package:flutter/material.dart';
import 'package:studentmap/domain_layer/building_manager/building.dart';
import 'package:studentmap/domain_layer/building_manager/building_manager.dart';

class SearchTab extends StatelessWidget {
  const SearchTab(this.controller,this.manager, {super.key});

  final TextEditingController controller;
  final BuildingManager manager;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          TextField(
            controller: controller,
            decoration:
                const InputDecoration(labelText: "Search for a building"),
          ),
          ElevatedButton(
            onPressed: () {
              List<Building> buildings =
                  manager.getMatchingBuildingsByName(controller.text);

              for (Building building in buildings) {
                print(building.getName());
              }
            },
            child: const Text("Search"),
          ),
        ]));
  }
}
