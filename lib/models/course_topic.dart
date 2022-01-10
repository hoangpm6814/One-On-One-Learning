import 'package:flutter/foundation.dart';

class CourseTopic {
  final String id;
  final String courseId;
  final String name;
  final String nameFile;
  final int orderCourse;
  final String videoUrl;
  final String description;

  CourseTopic({
    @required this.id,
    @required this.courseId,
    @required this.name,
    @required this.nameFile,
    @required this.orderCourse,
    @required this.videoUrl,
    @required this.description,
  });
}
