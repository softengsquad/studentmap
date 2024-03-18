import 'package:flutter/material.dart';
import 'package:studentmap/ui_layer/buildinginfo.dart';

class BuildingInfoTab extends StatelessWidget {
  const BuildingInfoTab(this.currentBuildingInfo,{super.key});

  final CurrentBuildingInfo currentBuildingInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: BuildingInfo(currentBuildingInfo.building),
    );
  }
}