import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/tutor.dart';

class TutorProvider with ChangeNotifier {
  List<Tutor> get listTutor {
    // sort by rating
    // _tutorList.sort((a, b) => b.rating.compareTo(a.rating));

    // sort by favourite and rating, favourite in higher priority
    _tutorList.sort(compareTutors);
    return _tutorList;
  }

  int compareTutors(Tutor tutor1, Tutor tutor2) {
    if ((tutor1.isFavourite && !tutor2.isFavourite)) {
      return -1;
    } else if ((!tutor1.isFavourite && tutor2.isFavourite)) {
      return 1;
    } else
      return tutor2.rating.compareTo(tutor1.rating);
  }

  void toggleIsFavourite(String id) {
    int index = _tutorList.indexWhere((todo) => todo.id == id);
    _tutorList[index].isFavourite = !_tutorList[index].isFavourite;
    notifyListeners();
  }

  Tutor getById(String id) {
    return _tutorList.firstWhere((todo) => todo.id == id);
  }

  final List<Tutor> _tutorList = DUMMY_TUTORS;
}
