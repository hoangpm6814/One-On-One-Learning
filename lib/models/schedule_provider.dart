import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/schedule.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> get listSchedule {
    return _scheduleList;
  }

  Schedule getById(String id) {
    return _scheduleList.firstWhere((schedule) => schedule.id == id);
  }

  final List<Schedule> _scheduleList = DUMMY_SCHEDULES;
}
