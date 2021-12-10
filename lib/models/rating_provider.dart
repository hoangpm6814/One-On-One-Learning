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

  void createNewRating(Rating rating) {
    final newRating = Rating(
      id: rating.id,
      studentId: rating.studentId,
      tutorId: rating.tutorId,
      date: rating.date,
      comment: rating.comment,
      star: rating.star,
    );
    _ratingList.add(newRating);
    notifyListeners();
  }

  final List<Rating> _ratingList = DUMMY_RATINGS;
}
