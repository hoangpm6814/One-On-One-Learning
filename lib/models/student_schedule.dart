import 'package:flutter/foundation.dart';

class StudentSchedule {
  final String id;
  final String tutorName;
  final String tutorAvatar;
  final String tutorCountry;
  final String scheduleDetailId;
  final String startTime;
  final String endTime;
  final String date;
  final DateTime startTimeDateTime;
  final DateTime endTimeDateTime;
  final String studentRequest;
  final String tutorReview;

  StudentSchedule({
    @required this.id,
    @required this.tutorName,
    @required this.tutorAvatar,
    @required this.tutorCountry,
    @required this.scheduleDetailId,
    @required this.startTime,
    @required this.endTime,
    @required this.date,
    @required this.startTimeDateTime,
    @required this.endTimeDateTime,
    @required this.studentRequest,
    @required this.tutorReview,
  });
}
