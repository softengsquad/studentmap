import 'package:flutter/material.dart';
import 'package:studentmap/ui_layer/authentication/google_sign_in_button.dart';
import 'package:studentmap/ui_layer/calendar.dart';

/// This tab holds the calendar for the user
/// Displays the [GoogleSignInButton] and the [Calendar] widget
class CalendarTab extends StatelessWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          GoogleSignInButton(),
          Calendar(),
        ]));
  }
}
