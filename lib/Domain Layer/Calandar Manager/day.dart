import 'package:intl/intl.dart';
import 'package:studentmap/Domain%20Layer/Calandar%20Manager/session.dart';

/// Holds information about the sessions that are occurring this day.
/// - Stores the date in **DateTime** Format.
/// - Stores a **List** of sessions (in **Session** format)
class Day {
  DateTime date;
  late String weekDay; // When it is in the week
  late List<Session> sessions;
  
  Day(this.date, this.sessions) {
    weekDay = _getWeekDay();
  }

  /// Fetches the name of The Day
  String _getWeekDay() => DateFormat('EEEE').format(date);

  /// Returns a **List** Of session Strings
  List<String> getSchedule() => [for(Session session in sessions) session.getSessionString()];
}
