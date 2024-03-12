import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import "/domain_layer/building_manager/building.dart";
import "/data_layer/database.dart";

/// Describes an interactive map that is used to display buildings and routes.
class InteractiveMap extends StatefulWidget {
  const InteractiveMap({super.key});

  @override
  State<InteractiveMap> createState() => _InteractiveMap();
}

class _InteractiveMap extends State<InteractiveMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(50.79812, -1.09571),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    var db = context.read<Database>();

    return FutureBuilder(
        future: db.getAllBuildings(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Building>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                markers: buildingMarkers(snapshot.data!),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            );
          } else {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  /// Transfosms a list of buildings into a set of [Marker] to be drawn
  /// on the interactive map.
  Set<Marker> buildingMarkers(List<Building> buildings) {
    var set = <Marker>{};

    for (var b in buildings) {
      set.add(Marker(
        markerId: MarkerId(b.id.toString()),
        position: b.getPosition(),
      ));
    }

    return set;
  }

  /// Returns the colour for a building based on its type.
  Color colorForBuilding(Building building) {
    switch (building.type.toLowerCase()) {
      case "uni":
        return Colors.red;
      case "mark":
        return Colors.blue;
      case "soc":
        return Colors.yellow;
      default:
        return Colors.black;
    }
  }
}
