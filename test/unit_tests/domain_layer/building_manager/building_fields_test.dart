import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/domain_layer/building_manager/building.dart';

void main() {
  group("Building, field tests | ", () {
    test("Id initializes to '1'", () {
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
      expect(1, testObj.id);
    });

    test("Name initializes to 'Richmond'", () {
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
      expect("Richmond", testObj.name);
    });


    // Test for initializing addressLine1
    test("Address Line 1 initializes to 'Portland St'", () {
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
      expect("Portland St", testObj.addressLine1);
    });

// Test for initializing addressLine2
    test("Address Line 2 initializes to 'Portsmouth'", () {
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
      expect("Portsmouth", testObj.addressLine2);
    });

// Test for initializing postcode
    test("Postcode initializes to 'PO1 3DE'", () {
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
      expect("PO1 3DE", testObj.postcode);
    });

// Test for initializing type
    test("Type initializes to 'uni'", () {
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
      expect("uni", testObj.type);
    });

// Test for initializing favourited
    test("Favourited initializes to 'false'", () {
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
      expect(false, testObj.favourited);
    });

// Test for initializing longitude
    test("Longitude initializes to '50.7981'", () {
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
      expect(50.7981, testObj.longitude);
    });

// Test for initializing latitude
    test("Latitude initializes to '1.0995'", () {
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
      expect(1.0995, testObj.latitude);
    });
  });
}
