import 'package:flutter/material.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TutorProvider with ChangeNotifier {
  final String authToken;

  TutorProvider(this.authToken, this._tutorList);

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

  // void toggleIsFavourite(String id) {
  //   int index = _tutorList.indexWhere((tutor) => tutor.id == id);
  //   _tutorList[index].isFavourite = !_tutorList[index].isFavourite;
  //   notifyListeners();
  // }

  Future<void> toggleIsFavourite(String userId) async {
    int index = _tutorList.indexWhere((tutor) => tutor.userId == userId);
    final oldStatus = _tutorList[index].isFavourite;
    // temporarily change stutus offline
    _tutorList[index].isFavourite = !_tutorList[index].isFavourite;
    notifyListeners();
    // print("go toggle favourite");
    try {
      final url = Uri.parse(
          'https://sandbox.api.lettutor.com/user/manageFavoriteTutor');
      Map<String, String> headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${authToken}"
      };
      final response = await http.post(
        url,
        body: {'tutorId': userId},
        headers: headers,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode >= 400) {
        // print("go toggle favourite error");
        _tutorList[index].isFavourite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      // print("go toggle favourite error 2");
      _tutorList[index].isFavourite = oldStatus;
      notifyListeners();
      throw error;
    }
  }

  Tutor getById(String id) {
    return _tutorList.firstWhere((tutor) => tutor.id == id);
  }

  // List<Tutor> _tutorList = DUMMY_TUTORS;
  List<Tutor> _tutorList = [];

  Future<void> fetchTutors([bool filterByUser = false]) async {
    var url = Uri.parse(
        'https://sandbox.api.lettutor.com/tutor/more?perPage=9&page=1');
    Map<String, String> headers = {"Authorization": "Bearer ${authToken}"};
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var tutors = extractedData["tutors"];
      var rows = tutors["rows"];
      var tutorList = List.from(rows);

      var favouriteTutorIds = extractedData["favoriteTutor"];
      var favouriteTutorIdList = List.from(favouriteTutorIds);

      if (extractedData == null) {
        return;
      }

      final List<Tutor> loadedTutors = [];
      final List<String> loadedfavouriteTutorIds = [];

      for (int i = 0; i < favouriteTutorIdList.length; i++) {
        loadedfavouriteTutorIds.add(favouriteTutorIdList[i]['secondId']);
      }

      for (int i = 0; i < tutorList.length; i++) {
        var feedbacks = tutorList[i]['feedbacks'];
        var feedbackList = List.from(feedbacks);
        final List<Review> loadedFeedbacks = [];
        double rating = 0;
        for (int j = 0; j < feedbackList.length; j++) {
          print(feedbackList[j]['firstId']);
          loadedFeedbacks.add(Review(
            id: feedbackList[j]['id'],
            firstId: feedbackList[j]['firstId'],
            secondId: feedbackList[j]['secondId'],
            rating: feedbackList[j]['rating'],
            content: feedbackList[j]['content'],
            createdAt: feedbackList[j]['createdAt'],
            updatedAt: feedbackList[j]['updatedAt'],
            avatar: feedbackList[j]['firstInfo']['avatar'],
            name: feedbackList[j]['firstInfo']['name'],
          ));
          rating += feedbackList[j]['rating'];
        }
        if (feedbackList.length != 0) {
          rating = rating / feedbackList.length;
        }
        // print(rating);
        loadedTutors.add(Tutor(
          id: tutorList[i]['id'],
          userId: tutorList[i]['userId'],
          name: tutorList[i]['name'],
          rating: rating == 0 ? 4 : rating,
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
        loadedTutors[i].reviews = loadedFeedbacks;
      }

      for (int i = 0; i < loadedfavouriteTutorIds.length; i++) {
        int index = loadedTutors
            .indexWhere((tutor) => tutor.userId == loadedfavouriteTutorIds[i]);
        loadedTutors[index].isFavourite = true;
      }

      // _tutorList = loadedTutors;
      _tutorList.clear();
      _tutorList.addAll(loadedTutors);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
