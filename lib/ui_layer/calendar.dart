import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '/ui_layer/authentication.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    var googleAuth = context.watch<GoogleAuth>(); // Rebuilds if user changes.

    return FutureBuilder( // Check if user is signed in.
      future: googleAuth.isSignedIn(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
            return const CircularProgressIndicator();
        }

        if (!snapshot.data) {
            return const Text("Cannot display calendar - not signed in");
        }

        return FutureBuilder( // Try to obtain HTTP client for Google user.
          future: googleAuth.getHttpClient(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            var httpClient = snapshot.data!;
            var calendarApi = CalendarApi(httpClient);

            return FutureBuilder( // Obtain the user's list of calendars.
              future: calendarApi.calendarList.list(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }

                var calendars = snapshot.data!;

                String? uopCalendarId;
                for (var e in calendars.items) {
                  // FIXME: This isn't a great way to identify which
                  // calendar holds the timetabling information, because
                  // even though 'UoP Timetable' is the default calendar name,
                  // the user may name theirs differently.
                  if (e.summary.toLowerCase() == "uop timetable") {
                    uopCalendarId = e.id!;
                    break;
                  }
                }

                if (uopCalendarId == null) {
                  return const Text("Failed to find timetable calendar");
                }

                return FutureBuilder( // Obtain the events within the timetable calendar.
                  future: calendarApi.events.list(uopCalendarId),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    DateFormat dayMonthFormatter = DateFormat("EEEE, d MMMM");
                    DateFormat timeFormatter = DateFormat("Hm");
                    DateTime now = DateTime.now();
                    now = now.add(Duration(days: 3)); // TODO: remove

                    List<Event> events = snapshot.data!.items!;

                    List<Event> eventsToday = events.where((e) =>
                      e.start!.dateTime!.day == now.day
                      && e.start!.dateTime!.month == now.month
                      && e.start!.dateTime!.year == now.year).toList();

                    eventsToday.sort((a, b) => a.start!.dateTime!.compareTo(b.start!.dateTime!));

                    List<Widget> widgets = [];
                    for (var e in eventsToday) {
                      widgets.add(Text(e.summary!, overflow: TextOverflow.ellipsis));
                      widgets.add(Text("${timeFormatter.format(e.start!.dateTime!)} - ${timeFormatter.format(e.end!.dateTime!)}"));
                      widgets.add(Text(e.location!));
                      widgets.add(const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                      ));
                    }

                    return Column(
                      children: <Widget>[
                        Text("Timetable for ${dayMonthFormatter.format(now)}"),
                        const Padding(
                          padding: EdgeInsetsDirectional.symmetric(vertical: 6),
                        ),
                        for (Widget w in widgets)
                          w
                      ]
                    );
                  }
                );
              }
            );
          }
        );
      }
    );
  }
}
