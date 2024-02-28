import 'package:studentmap/domain_layer/building_manager/building.dart';

/// This object will allow the main application to interface
/// with the rest of the objects in the 'Building Manager'
/// sub system.
class BuildingManager {
  List<Building> buildings = [];

  BuildingManager(this.buildings);


  /// Returns buildings that contain a search term
  /// defined in  **Input**.
  List<Building> getMatchingBuildings(String input) {
    // Perform input validation here
    String substring = input.toLowerCase();
    List<Building> output = [];
    for (Building building in buildings) {
      String buildingName = building.getName();

      if (buildingName.contains(substring)) {
        output.add(building);
      }
    }
    return output;
  }
}
