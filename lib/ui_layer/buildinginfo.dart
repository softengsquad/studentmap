import 'package:flutter/material.dart';
import "/domain_layer/building_manager/building.dart";

class BuildingInfo extends StatelessWidget {
  const BuildingInfo(this.building, {super.key});

  final Building building;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(building.name),
      ]
    );
  }
}
