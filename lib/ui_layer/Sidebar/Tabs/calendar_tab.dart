import 'package:flutter/material.dart';
import 'package:studentmap/ui_layer/authentication.dart';
import 'package:studentmap/ui_layer/calendar.dart';

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
