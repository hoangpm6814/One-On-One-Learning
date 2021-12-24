import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  List<Tutor> _tutorList = DUMMY_TUTORS;

  Future<void> fetchAndSetTutors([bool filterByUser = false]) async {
    var url = Uri.parse(
        'https://sandbox.api.lettutor.com/tutor/more?perPage=9&page=1');
    // Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NzVhNjJlYi00YWY5LTQ0MWUtYTE5Ny0yOGNhYzdjYWFkNWEiLCJpYXQiOjE2NDAyNzM1MTAsImV4cCI6MTY0MDM1OTkxMCwidHlwZSI6ImFjY2VzcyJ9.ilwJPEUU0SdwH6Ixmtr08VIhmTKM1a9JrATmQZO6Z_w"
    };
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      // url =
      //     Uri.https('flutter-update.firebaseio.com', '/userFavorites/$userId.json?auth=$authToken');
      // final favoriteResponse = await http.get(url);
      // final favoriteData = json.decode(favoriteResponse.body);

      print(response);
      print(extractedData);
      // // start
      // final List<Tutor> loadedTutors = [];
      // extractedData.forEach((tutorId, tutorData) {
      //   loadedTutors.add(Tutor(
      //     id: tutorId,
      //     title: tutorData['title'],
      //     description: tutorData['description'],
      //     price: tutorData['price'],
      //     // isFavorite:
      //     //     favoriteData == null ? false : favoriteData[prodId] ?? false,
      //     imageUrl: tutorData['imageUrl'],
      //   ));
      // });
      // _tutorList = loadedTutors;
      // notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
