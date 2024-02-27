import 'package:flutter/material.dart';
import "/domain_layer/building_manager/building.dart";

class BuildingInfo extends StatelessWidget {
  const BuildingInfo(this.building, {super.key});

  final Building building;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(building.name),
            Text("${building.addressLine1}, ${building.addressLine2}"),
            Text(building.postcode),
          ],
        ),
        const Column(
          children: <Widget>[],
        ),
      ],
    );
  }
}
