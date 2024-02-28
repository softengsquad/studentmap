import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/domain_layer/building_manager/building.dart';
import 'package:studentmap/domain_layer/building_manager/building_manager.dart';

void main() {
  group("Building Manager fields |", () {
    test("buildings initializes to []", () {
      // Arrange
      List<Building> buildings = [];

      // Act
      BuildingManager testObj = BuildingManager(buildings);

      // Assert
      expect([], testObj.buildings);
    });

    test("Buildings has 3 elements", () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];

      // Act
      BuildingManager testObj = BuildingManager(buildings);

      // Assert
      expect(3, testObj.buildings.length);
    });
  });

  group("Building Manager Methods", () {
    test("getMatchingBuildingsByName returns [] for input 'nobuildings'", () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "nobuildings";

      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect([], output);
    });

    test(
        "getMatchingBuildingsByName gives output of length 3 for input 'Building'",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "Building";
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect(3, output.length);
    });

    test(
        "getMatchingBuildingsByName gives output of length 3 for input 'B'",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "B";
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect(3, output.length);
    });

    test(
        "getMatchingBuildingsByName gives output of length 3 for input 'uil'",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "uil";
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect(3, output.length);
    });

    test(
        "getMatchingBuildingsByName gives output of length 1 for input 'Building A'",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "Building A";
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect(1, output.length);
    });

    test(
        "getMatchingBuildingsByName gives output of [] for input invalid input '123&*^'",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String input = "123&*^'";
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect([], output);
    });

    test(
        "getMatchingBuildingsByName gives output [] for null input",
        () {
      // Arrange
      List<Building> buildings = [
        Building(
          id: 1,
          name: "Building A",
          addressLine1: "Address 1",
          addressLine2: "City 1",
          postcode: "12345",
          type: "Type A",
          favourited: true,
          latitude: 40.7128,
          longitude: -74.0060,
        ),
        Building(
          id: 2,
          name: "Building B",
          addressLine1: "Address 2",
          addressLine2: "City 2",
          postcode: "23456",
          type: "Type B",
          favourited: false,
          latitude: 34.0522,
          longitude: -118.2437,
        ),
        Building(
          id: 3,
          name: "Building C",
          addressLine1: "Address 3",
          addressLine2: "City 3",
          postcode: "34567",
          type: "Type C",
          favourited: true,
          latitude: 51.5074,
          longitude: -0.1278,
        ),
      ];
      BuildingManager testObj = BuildingManager(buildings);
      String? input;
      // Act
      List<Building> output = testObj.getMatchingBuildingsByName(input);

      // Assert
      expect([], output);
    });

  });
}
