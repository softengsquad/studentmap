import 'package:flutter_test/flutter_test.dart';
import 'package:studentmap/domain_layer/calandar_manager/session.dart';

void main() {
  group("Session, Field Tests | ", () {
    test("Name is initialized to 'Programming'", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);

      // Assert
      expect("Programming", testObj.name);
    });

    test("Start is initialized to 12am", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);

      // Assert
      expect(12, testObj.start.hour);
    });

    test("End is initialized to 1pm", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);

      // Assert
      expect(13, testObj.end.hour);
    });

    test("Building is initialized to 'Liongate'", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);

      // Assert
      expect("Liongate", testObj.building);
    });

    test("Room is initialized to '0.14'", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);

      // Assert
      expect("0.14", testObj.room);
    });
  });

  group("Session, Method Tests | ", () {
    
    test("getSessionString returns 'Programming, 12am - 1pm, Liongate (0.14)'", () {
      
      // Arrange
      String sessionName = "Programming";
      DateTime start = DateTime(2012, 4, 1, 12); // Format {Year, Month, Day, Hour}
      DateTime end = DateTime(2012, 4, 2, 13);
      String building = "Liongate";
      String room = "0.14";

      // Act
      Session testObj = Session(sessionName, start, end, building, room);
      String sessionString = testObj.getSessionString();
      // Assert
      expect("Programming, 12am - 1pm, Liongate (0.14)", sessionString);
    });
  });
}
