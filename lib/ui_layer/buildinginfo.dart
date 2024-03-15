import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "/domain_layer/building_manager/building.dart";
import "/util.dart";

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
      return const Center(
          child: Text("No building - tap a building to view its info."));
    }

    CurrentBuildingInfo buildingInfo = context.read<CurrentBuildingInfo>();

    return Column(
      children: <Widget>[
        Text(building!.name),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
        ),
        Text("${building!.addressLine1}, ${building!.addressLine2}"),
        Text(prettifyPostcode(building!.postcode)),
        IconButton(
            icon: Icon(
                building!.favourited ? Icons.favorite : Icons.favorite_border),
            tooltip:
                "${building!.favourited ? "Unfavourite" : "Favourite"} building",
            onPressed: () {
              buildingInfo.setFavouritedStatus(!building!.favourited);
            }),
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

  /// Updates the favourite status of the currently selected [Building].
  void setFavouritedStatus(bool fave) {
    Building b = _building!;

    // Create a new Building object because the favourited field inside
    // Building is final, so it cannot be modified.
    building = Building(
      id: b.id,
      name: b.name,
      addressLine1: b.addressLine1,
      addressLine2: b.addressLine2,
      postcode: b.postcode,
      type: b.type,
      favourited: fave,
      longitude: b.longitude,
      latitude: b.latitude,
    );
  }
}
