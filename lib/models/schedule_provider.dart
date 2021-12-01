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

  void createNewSchedule(Schedule schedule) {
    // print("shift:" + schedule.shift.toString());
    // print("requirement:" + schedule.requirement);
    final newSchedule = Schedule(
      id: schedule.id,
      studentId: schedule.studentId,
      tutorId: schedule.tutorId,
      date: schedule.date,
      shift: schedule.shift,
      requirement: schedule.requirement,
    );
    _scheduleList.add(newSchedule);
    notifyListeners();
  }

  void editSchedule(Schedule schedule) {
    removeSchedule(schedule.id);
    createNewSchedule(schedule);
  }

  void removeSchedule(String id) {
    _scheduleList.removeWhere((schedule) => schedule.id == id);
    notifyListeners();
  }

  final List<Schedule> _scheduleList = DUMMY_SCHEDULES;
}
