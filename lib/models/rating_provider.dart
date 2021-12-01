import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/rating.dart';

class RatingProvider with ChangeNotifier {
  List<Rating> get listRating {
    return _ratingList;
  }

  Rating getById(String id) {
    return _ratingList.firstWhere((todo) => todo.id == id);
  }

  List<Rating> getByTutorId(String tutorId) {
    return _ratingList.where((todo) => todo.tutorId == tutorId).toList();
  }

  final List<Rating> _ratingList = DUMMY_RATINGS;
}
