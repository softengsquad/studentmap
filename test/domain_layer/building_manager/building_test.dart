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

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

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

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect("Richmond", testObj.name);
    });

    test("Address Line 1 initializes to 'Portland St'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect("Portland St", testObj.addressLine1);
    });

    test("Address Line 2 initializes to 'Portsmouth'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect("Portsmouth", testObj.addressLine2);
    });

    test("Postcode initializes to 'PO1 3DE'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect("PO1 3DE", testObj.postcode);
    });

    test("Type initializes to 'uni'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect("uni", testObj.type);
    });

    test("Favourited initializes to 'false'", () {
      // Arrange
      int id = 1;
      String name = "Richmond";
      String addressLine1 = "Portland St";
      String addressLine2 = "Portsmouth";
      String postcode = "PO1 3DE";
      String type = "uni";
      bool favourited = false;

      // Act
      Building testObj = Building(
          id: id,
          name: name,
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          postcode: postcode,
          favourited: favourited,
          type: type);

      // Assert
      expect(false, testObj.favourited);
    });
  });
}
