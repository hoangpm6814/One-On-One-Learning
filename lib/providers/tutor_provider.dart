import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TutorProvider with ChangeNotifier {
  final String authToken;

  TutorProvider(this.authToken, this._tutorList);

  // List<Tutor> _tutorList = DUMMY_TUTORS;
  List<Tutor> _tutorList = [];
  List<Tutor> _tutorSearchList = [];
  int totalPages = 1;
  int pageSize = 3;
  int _totalRecords = 0;

  double get totalRecords => _totalRecords.toDouble();

  List<Tutor> get listTutor {
    // sort by rating
    // _tutorList.sort((a, b) => b.rating.compareTo(a.rating));

    // sort by favourite and rating, favourite in higher priority
    _tutorList.sort(compareTutors);
    return _tutorList;
    // return [..._tutorList];
  }

  List<Tutor> get listSearchTutor {
    _tutorSearchList.sort(compareTutors);
    return _tutorSearchList;
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
      final url = Uri.parse('${base_url}/user/manageFavoriteTutor');
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

  Future<void> fetchTutors([bool filterByUser = false]) async {
    var url = Uri.parse('${base_url}/tutor/more?perPage=9&page=1');
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
        if (index != -1) {
          loadedTutors[index].isFavourite = true;
        }
      }

      _tutorList = loadedTutors;
      // _tutorList.clear();
      // _tutorList.addAll(loadedTutors);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<List<Tutor>> fetchSearchTutors(
      List<String> specialties, int pageNumber) async {
    var url = Uri.parse('${base_url}/tutor/search');
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json",
    };
    // List<String> data = [];
    // // data.add(scheduleDetailId);
    // data = specialties;
    for (int i = 0; i < specialties.length; i++) {
      print("specialties in provider: " + specialties[i]);
    }
    // var filters = json.encode(
    //   {
    //     'specialties': specialties,
    //   },
    // );
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'filters': {
              'specialties': specialties,
            },
            'page': pageNumber,
            'perPage': pageSize,
          },
        ),
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return [];
      }

      var rows = extractedData["rows"];
      _totalRecords = extractedData['count'];
      var tutorList = List.from(rows);

      final List<Tutor> loadedTutors = [];

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
      print("loadedTutors: " + loadedTutors.length.toString());
      // _tutorSearchList = loadedTutors;
      // notifyListeners();

      return loadedTutors;
    } catch (error) {
      // throw (error);
      print("get search error");
      throw (error);
    }
  }

  Future<void> fetchSearchTutorsPage(List<String> specialties, int pageNumber,
      [bool isBegin = false]) async {
    if (pageNumber <= totalPages) {
      var loadedTutors = await fetchSearchTutors(specialties, pageNumber);
      if (isBegin) {
        totalPages = countTotalPage(totalRecords, pageSize);
        print("totalPages: " + totalPages.toString());
        _tutorSearchList = loadedTutors;
      } else {
        if (pageNumber == 1 && _totalRecords > 0) {
          _tutorSearchList.clear();
        }
        _tutorSearchList.addAll(loadedTutors);
      }
      // print("_courseList: " + _tutorSearchList.length.toString());
      notifyListeners();
    }

    // if (pageNumber > totalPages) {
    //   notifyListeners();
    // }
  }

  int countTotalPage(double totalRecords, int pageSize) {
    if (totalRecords % pageSize == 0) {
      return totalRecords ~/ pageSize;
    } else {
      int whole = totalRecords ~/ pageSize;
      return whole + 1;
    }
  }

  Future<String> reportTutor(String tutorId, String content) async {
    final url = Uri.parse('${base_url}/report');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authToken}"
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'tutorId': tutorId,
            'content': content,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        print("report failed");
        return responseData['message'];
      }

      print("report success");
      return responseData['message'];
    } catch (error) {
      throw error;
    }
  }
}
