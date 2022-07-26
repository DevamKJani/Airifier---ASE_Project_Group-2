import 'package:ase_project1/Model/event_editing.dart';
import 'package:ase_project1/provider/eventProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      backgroundColor: Colors.white,
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.white,
    );
  }
}
