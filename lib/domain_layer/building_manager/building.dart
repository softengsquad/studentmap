import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Holds information about the building types. This object
/// is to be used when fetching information from the **database**.
/// 1. University - "uni"
/// 2. Supermarket - "mark"
/// 3. Social - "soc"
class Building {
  final int id;
  final String name;
  final String addressLine1;
  final String addressLine2;
  final String postcode;
  final String type; // The building type
  final bool favourited;

  // For storing information about position on Google Maps
  double longitude;
  double latitude;

  Building(
      {required this.id,
      required this.name,
      required this.addressLine1,
      required this.addressLine2,
      required this.postcode,
      required this.type,
      required this.favourited,
      required this.latitude,
      required this.longitude});

  /// Returns the position of this building
  LatLng getPosition() => LatLng(latitude, longitude);

  /// Returns the name of the building in **Lower Case**
  String getName() => name.toLowerCase();
}
