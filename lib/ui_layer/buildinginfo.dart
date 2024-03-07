import 'package:flutter/material.dart';
import "/domain_layer/building_manager/building.dart";

/// A widget that displays the information for a specified [Building].
///
/// If the given [Building] is null, simple text is displayed telling the 
/// user that a building hasn't been specified (e.g. tapping on a 
/// building within the map).
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

/// Holds the current [Building] (if there is one), that the user
/// wishes to view the information for.
///
/// This class implements [ChangeNotifier] and will notify any listeners
/// once the [Building] within has been changed.
class CurrentBuildingInfo extends ChangeNotifier {
  Building? _building;

  /// Set the current [Building] and notify listeners.
  set building(Building? building) {
    _building = building;
    notifyListeners();
  }

  /// Retrieve the stored [Building].
  Building? get building {
    return _building;
  }
}
