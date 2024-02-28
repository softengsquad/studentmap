import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:studentmap/domain_layer/building_manager/building.dart';

void main() {
  group("Building, method tests | ", () {
    test("Return Position returns of type 'LatLng'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;
      double longitude = 50.7981;
      double latitude = 1.0995;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type,
          longitude: longitude,
          latitude: latitude);

      // Assert
      expect(LatLng, testObj.getPosition().runtimeType);
    });

    test("Return Position returns value 'LatLng(50.7981, 1.0995)'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;
      double longitude = 50.7981;
      double latitude = 1.0995;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type,
          longitude: longitude,
          latitude: latitude);

      // Assert
      expect(LatLng(latitude, longitude), testObj.getPosition());
    });
  });
}
