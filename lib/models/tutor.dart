import 'package:flutter/foundation.dart';

class Tutor {
  final String id;
  final String name;
  final double rating;
  final String avatar;
  final String discription;

  Tutor({
    @required this.id,
    @required this.name,
    @required this.rating,
    @required this.avatar,
    @required this.discription,
  });
}
