import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/tutor.dart';

class TutorProvider with ChangeNotifier {
  List<Tutor> get listTutor {
    return _tutorList;
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
