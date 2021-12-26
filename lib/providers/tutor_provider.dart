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
    // return [..._tutorList];
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
  // List<Tutor> _tutorList = [];

  Future<void> fetchTutors([bool filterByUser = false]) async {
    var url = Uri.parse(
        'https://sandbox.api.lettutor.com/tutor/more?perPage=9&page=1');
    Map<String, String> headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZTE2YjlkZC1iYWJiLTQ1OTItYmM0YS1hZThmOGE4NWYxNTIiLCJpYXQiOjE2NDA0OTExMjQsImV4cCI6MTY0MDU3NzUyNCwidHlwZSI6ImFjY2VzcyJ9.JBwNvwsa1KnB4I2eUBTdwGHw3S-maoc9wi-TMug8v5A"
    };
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var tutors = extractedData["tutors"];
      var rows = tutors["rows"];
      var tutorList = List.from(rows);
      if (extractedData == null) {
        return;
      }

      final List<Tutor> loadedTutors = [];
      for (int i = 0; i < tutorList.length; i++) {
        // print(tutorList[i]);
        loadedTutors.add(Tutor(
          id: tutorList[i]['id'],
          name: tutorList[i]['name'],
          rating: 5,
          avatar: tutorList[i]['avatar'],
          bio: tutorList[i]['bio'],
          country: tutorList[i]['country'],
          languages: tutorList[i]['languages'],
          education: tutorList[i]['education'],
          experience: tutorList[i]['experience'],
          interests: tutorList[i]['interests'],
          profession: tutorList[i]['profession'],
          specialties: tutorList[i]['specialties'],
          video: tutorList[i]['video'],
          targetStudent: tutorList[i]['targetStudent'],
          isNative: tutorList[i]['isNative'],
          isOnline: tutorList[i]['isOnline'],
          price: tutorList[i]['price'],
        ));
      }

      // tutors.forEach((index, tutorData) {
      //   loadedTutors.add(Tutor(
      //     // id: tutorId,
      //     // title: tutorData['title'],
      //     // description: tutorData['description'],
      //     // price: tutorData['price'],
      //     // // isFavorite:
      //     // //     favoriteData == null ? false : favoriteData[prodId] ?? false,
      //     // imageUrl: tutorData['imageUrl'],

      //     id: tutorData['id'],
      //     name: tutorData['name'],
      //     rating: 5,
      //     avatar: tutorData['avatar'],
      //     bio: tutorData['bio'],
      //     country: tutorData['country'],
      //     languages: tutorData['languages'],
      //     education: tutorData['education'],
      //     experience: tutorData['experience'],
      //     interests: tutorData['interests'],
      //     profession: tutorData['profession'],
      //     specialties: tutorData['specialties'],
      //     video: tutorData['video'],
      //     targetStudent: tutorData['targetStudent'],
      //     isNative: tutorData['isNative'],
      //     isOnline: tutorData['isOnline'],
      //     price: tutorData['price'],
      //   ));
      // });

      // _tutorList = loadedTutors;
      _tutorList.addAll(loadedTutors);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
