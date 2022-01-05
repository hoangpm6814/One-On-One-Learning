import 'package:flutter/foundation.dart';

class TutorSchedule {
  final String id;
  final String scheduleDetailId;
  final String startTime;
  final String endTime;
  final String date;
  // final int shift;
  // final String requirement;

  TutorSchedule({
    @required this.id,
    @required this.scheduleDetailId,
    @required this.startTime,
    @required this.endTime,
    @required this.date,
    // @required this.shift,
    // @required this.requirement,
  });
}
