import 'package:flutter/foundation.dart';

class Rating {
  final String id;
  final int star;
  final String comment;
  final String tutorId;
  final String studentId;
  final DateTime date;

  Rating({
    @required this.id,
    @required this.star,
    @required this.comment,
    @required this.tutorId,
    @required this.studentId,
    @required this.date,
  });
}
