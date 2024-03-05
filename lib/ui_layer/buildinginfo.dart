import 'package:flutter/material.dart';
import "/domain_layer/building_manager/building.dart";

class BuildingInfo extends StatelessWidget {
  const BuildingInfo(this.building, {super.key});

  final Building? building;

  @override
  Widget build(BuildContext context) {
    if (building == null) {
      return const Text("No building - tap a building to view its info.");
    }

    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(building!.name),
            Text("${building!.addressLine1}, ${building!.addressLine2}"),
            Text(building!.postcode),
          ],
        ),
        const Column(
          children: <Widget>[],
        ),
      ],
    );
  }
}

class CurrentBuildingInfo extends ChangeNotifier {
  Building? _building;

  set building(Building? building) {
    _building = building;
    notifyListeners();
  }

  Building? get building {
    return _building;
  }
}
