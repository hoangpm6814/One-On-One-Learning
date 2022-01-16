import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/course_topic.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseProvider with ChangeNotifier {
  final String authToken;

  CourseProvider(this.authToken);

  List<Course> get listCourse {
    return _courseList;
  }

  Course getById(String id) {
    return _courseList.firstWhere((tutor) => tutor.id == id);
  }

  List<Course> _courseList = [];
  int totalPages = 1;
  int pageSize = 4;
  int _totalRecords = 0;

  double get totalRecords => _totalRecords.toDouble();

  Future<List<Course>> fetchCourses(int pageNumber) async {
    // int _pageNumber = pageNumber;
    var url =
        Uri.parse('${base_url}/course?page=${pageNumber}&size=${pageSize}');
    print(url);
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/x-www-form-urlencoded",
    };
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return [];
      }

      var courses = extractedData["data"];
      var rows = courses["rows"];
      _totalRecords = courses['count'];
      var courseList = List.from(rows);

      final List<Course> loadedCourses = [];

      for (int i = 0; i < courseList.length; i++) {
        var topics = courseList[i]['topics'];
        var topicList = List.from(topics);
        final List<CourseTopic> loadedTopics = [];

        for (int j = 0; j < topicList.length; j++) {
          // print(topicList[j]['id']);
          loadedTopics.add(CourseTopic(
            id: topicList[j]['id'],
            courseId: topicList[j]['courseId'],
            name: topicList[j]['name'],
            nameFile: topicList[j]['nameFile'],
            orderCourse: topicList[j]['orderCourse'],
            videoUrl: topicList[j]['videoUrl'],
            description: topicList[j]['description'],
          ));
        }

        loadedCourses.add(Course(
          id: courseList[i]['id'],
          name: courseList[i]['name'],
          level: courseList[i]['level'],
          imageUrl: courseList[i]['imageUrl'],
          description: courseList[i]['description'],
          reason: courseList[i]['reason'],
          purpose: courseList[i]['purpose'],
          experience: courseList[i]['experience'],
          interests: courseList[i]['interests'],
          profession: courseList[i]['profession'],
        ));
        loadedCourses[i].topics = loadedTopics;
      }

      // _courseList = loadedCourses;
      // notifyListeners();
      return loadedCourses;
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchCoursesPage(int pageNumber) async {
    if (pageNumber <= totalPages) {
      var loadedSchedules = await fetchCourses(pageNumber);
      if (_courseList.length == 0) {
        totalPages = countTotalPage(totalRecords, pageSize);
        print("totalPages: " + totalPages.toString());
        _courseList = loadedSchedules;
      } else {
        if (pageNumber == 1 && _totalRecords > 0) {
          _courseList.clear();
        }
        _courseList.addAll(loadedSchedules);
      }
      print("_courseList: " + _courseList.length.toString());
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
}
