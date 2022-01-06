import 'package:flutter/foundation.dart';

class TutorSchedule {
  final String id;
  final String scheduleDetailId;
  final String startTime;
  final String endTime;
  final String date;
  final DateTime startTimeDateTime;
  final bool isBooked;
  // final int shift;
  // final String requirement;

  TutorSchedule({
    @required this.id,
    @required this.scheduleDetailId,
    @required this.startTime,
    @required this.endTime,
    @required this.date,
    @required this.startTimeDateTime,
    @required this.isBooked,
    // @required this.shift,
    // @required this.requirement,
  });
}
