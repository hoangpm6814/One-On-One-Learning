import 'package:flutter/foundation.dart';
import 'package:lettutor/models/course_topic.dart';

class Course {
  final String id;
  final String name;
  final String level;
  final String imageUrl;
  final String description;
  final String reason;
  final String purpose;
  final String experience;
  final String interests;
  final String profession;
  List<CourseTopic> topics;

  Course({
    @required this.id,
    @required this.name,
    @required this.level,
    @required this.imageUrl,
    @required this.description,
    @required this.reason,
    @required this.purpose,
    @required this.experience,
    @required this.interests,
    @required this.profession,
    this.topics = const [],
  });
}
