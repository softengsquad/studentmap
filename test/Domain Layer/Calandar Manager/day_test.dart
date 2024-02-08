import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/Domain%20Layer/Calandar%20Manager/day.dart';
import 'package:studentmap/Domain%20Layer/Calandar%20Manager/session.dart';

void main() {
  group("Day, Field Tests | ", () {
    
    test("Date initializes to '12th Feburary, 2012'", () {
      // Arrange
      DateTime date = DateTime(2012, 2, 12);

      // Act
      Day testObj = Day(date, []);

      // Assert
      expect(DateTime(2012 ,2, 12), testObj.date);
    });

    test("Weekday initializes to 'Sunday'", () {
      // Arrange
      DateTime date = DateTime(2012, 2, 12);

      // Act
      Day testObj = Day(date, []);

      // Assert
      expect("Sunday", testObj.weekDay);
    });

    test("Sessions initilaizes to ['Programming, 12am - 1pm, Liongate (0.14)']", () {
      // Arrange
      DateTime date = DateTime(2012, 2, 12);
      List<Session> sessions = [Session("Programming", DateTime(2012, 4, 1, 12), DateTime(2012, 4, 2, 13), "Liongate", "0.14")];

      // Act
      Day testObj = Day(date, sessions);

      // Assert
      expect(sessions[0], testObj.sessions[0]);
    });
  });

  group("Day, Method Tests | ", () {
    
    test("getSchedule returns '['Programming, 12am - 1pm, Liongate (0.14)', 'Networks, 2pm - 3pm, Portland (1.19)']'", () {
      // Arrange
      DateTime date = DateTime(2012, 2, 12);
      List<Session> sessions = [Session("Programming", DateTime(2012, 4, 1, 12), DateTime(2012, 4, 2, 13), "Liongate", "0.14"),
                                Session("Networks", DateTime(2012, 4, 1, 14), DateTime(2012, 4, 2, 15), "Portland", "1.19")];
      // Act
      Day testObj = Day(date, sessions);

      // Assert
      expect(['Programming, 12am - 1pm, Liongate (0.14)','Networks, 2pm - 3pm, Portland (1.19)'], testObj.getSchedule());
    });
  });

}