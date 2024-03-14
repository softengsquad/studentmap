import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '/ui_layer/authentication.dart';

/// Retrieves the user's UoP timetable from Google Calendar and
/// displays it.
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var googleAuth = context.watch<GoogleAuth>(); // Rebuilds if user changes.

    return FutureBuilder(
        // Check if user is signed in.
        future: googleAuth.isSignedIn(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.data) {
            return const Text("Cannot display calendar - not signed in");
          }

          return FutureBuilder(
              // Try to obtain HTTP client for Google user.
              future: googleAuth.getHttpClient(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                var httpClient = snapshot.data!;
                var calendarApi = CalendarApi(httpClient);

                return FutureBuilder(
                    // Obtain the user's list of calendars.
                    future: calendarApi.calendarList.list(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      String? calendarId =
                          findTimetableCalendar(snapshot.data!.items!);

                      if (calendarId == null) {
                        return const Text("Failed to find timetable calendar");
                      }

                      return FutureBuilder(
                          // Obtain the events within the timetable calendar.
                          future: calendarApi.events.list(calendarId),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            }

                            return timetable(snapshot.data!.items!);
                          });
                    });
              });
        });
  }

  /// Attempts to find the UoP Timetable calendar from a list of
  /// [CalendarListEntry.]
  String? findTimetableCalendar(List<CalendarListEntry> events) {
    for (var e in events) {
      // FIXME: This isn't a great way to identify which
      // calendar holds the timetabling information, because
      // even though 'UoP Timetable' is the default calendar name,
      // the user may name theirs differently.
      if (e.summary!.toLowerCase() == "uop timetable") {
        return e.id!;
      }
    }

    return null;
  }

  /// Constructs a basic timetable showing the events for current day.
  Widget timetable(List<Event> events) {
    DateFormat dayMonthFormatter = DateFormat("EEEE, d MMMM");
    DateFormat timeFormatter = DateFormat("Hm");

    List<Event> eventsToday = events
        .where((e) =>
            e.start!.dateTime!.day == date.day &&
            e.start!.dateTime!.month == date.month &&
            e.start!.dateTime!.year == date.year)
        .toList();

    eventsToday
        .sort((a, b) => a.start!.dateTime!.compareTo(b.start!.dateTime!));

    List<Widget> widgets = [];
    for (var e in eventsToday) {
      widgets.add(Text(e.summary!, overflow: TextOverflow.ellipsis));
      widgets.add(Text(
          "${timeFormatter.format(e.start!.dateTime!)} - ${timeFormatter.format(e.end!.dateTime!)}"));
      widgets.add(Text(e.location!));
      widgets.add(const Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
      ));
    }

    return Column(children: <Widget>[
      Text("Timetable for ${dayMonthFormatter.format(date)}"),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
            child: const Text("<"),
            onPressed: () {
              setState(() {
                date = date.subtract(const Duration(days: 1));
              });
            }),
        ElevatedButton(
            child: const Text(">"),
            onPressed: () {
              setState(() {
                date = date.add(const Duration(days: 1));
              });
            }),
      ]),
      const Padding(
        padding: EdgeInsetsDirectional.symmetric(vertical: 6),
      ),
      for (Widget w in widgets) w
    ]);
  }
}
