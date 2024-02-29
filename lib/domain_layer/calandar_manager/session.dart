/// A slot in the timetable.
/// - name -> The formal name of the session
/// - start -> The start time in **DateTime** format
/// - end -> The end time in **DateTime** format
/// - building -> The name of the building where the session will take place, in **String** format
class Session {
  String name;
  DateTime start;
  DateTime end;
  String building;
  String room;

  Session(this.name, this.start, this.end, this.building, this.room) {
    // Checks to see if there is a valid session.
    if (start.hour > end.hour && start.day == end.day) {
      throw Exception("Invalid Session");
    }
  }

  /// Returns a string containing all the information needed about the session
  String getSessionString() =>
      "$name, ${_getStringTime(start.hour)} - ${_getStringTime(end.hour)}, $building ($room)";

  String _getStringTime(int timeIn) {
    // Guard clause to catch invalid times
    if (timeIn > 24 || timeIn < 0) {
      throw Exception("Invalid time");
    }

    return (timeIn <= 12)
        ? "${timeIn.toString()}am"
        : "${(timeIn - 12).toString()}pm";
  }
}
