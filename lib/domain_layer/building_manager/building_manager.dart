import 'package:studentmap/domain_layer/building_manager/building.dart';
import 'package:studentmap/utility/validator.dart';

/// This object will allow the main application to interface
/// with the rest of the objects in the 'Building Manager'
/// sub system.
class BuildingManager {
  List<Building> buildings = [];

  BuildingManager(this.buildings);

  /// Returns buildings that contain a search term
  /// defined in  **Input**.
  List<Building> getMatchingBuildingsByName(String? input) {
    // Guard Clause to remove illegal inputs
    if (!Validator.validateStringInput(input)) {
      //TODO: Add some feedback for the user that will tell them why an input is invalid
      return [];
    }

    String substring = input!.toLowerCase(); // Validation catches null entries.
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
