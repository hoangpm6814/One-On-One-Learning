import 'package:flutter/foundation.dart';

class Schedule {
  final String id;
  final String studentId;
  final String tutorId;
  final DateTime date;
  final int shift;
  final String requirement;

  Schedule({
    @required this.id,
    @required this.studentId,
    @required this.tutorId,
    @required this.date,
    @required this.shift,
    @required this.requirement,
  });
}
