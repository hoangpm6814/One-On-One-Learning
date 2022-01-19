import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/student_schedule.dart';
import 'dart:convert';

class StudentScheduleProvider with ChangeNotifier {
  final String authToken;
  List<StudentSchedule> _scheduleList = [];
  List<StudentSchedule> _scheduleListHistory = [];
  int totalPages = 1;
  int pageSize = 4;
  int _totalRecords = 0;

  double get totalRecords => _totalRecords.toDouble();

  StudentScheduleProvider(this.authToken);

  List<StudentSchedule> get listSchedule {
    return _scheduleList;
  }

  List<StudentSchedule> get listScheduleHistory {
    return [..._scheduleListHistory];
  }

  StudentSchedule get earliestUpcommingLesson {
    // get first one in schedule list (have been sorted by day by API)
    return _scheduleList.firstWhere(
      (element) => element.endTimeDateTime.isAfter(DateTime.now()),
      orElse: () => StudentSchedule(
        id: "id",
        tutorName: "tutorName",
        tutorAvatar: "tutorAvatar",
        tutorCountry: "tutorCountry",
        scheduleDetailId: "scheduleDetailId",
        startTime: "08:00",
        endTime: "08:25",
        date: "date",
        startTimeDateTime: DateTime.now(),
        endTimeDateTime: DateTime.now(),
        studentRequest: "studentRequest",
        tutorReview: "tutorReview",
        showRecordUrl: false,
        recordUrl: "recordUrl",
        meetingToken: "meetingToken",
      ),
    );
  }

  Future<List<StudentSchedule>> fetchStudentSchedules(int pageNumber) async {
    DateTime fiveMinutesAgoFromNow =
        DateTime.now().subtract(const Duration(minutes: 5)); //DateTime
    String timestamp = fiveMinutesAgoFromNow.millisecondsSinceEpoch.toString();
    // print("timestamp: " + timestamp);
    int _pageNumber = pageNumber;
    // int _pageSize = pageSize;
    var url = Uri.parse(
        '${base_url}/booking/list/student?page=${_pageNumber}&perPage=${pageSize}&dateTimeGte=${timestamp}&orderBy=meeting&sortBy=asc');
    print(url);
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json"
    };
    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return [];
      }

      var data = extractedData["data"];
      var rows = data['rows'];
      _totalRecords = data['count'];
      var scheduleList = List.from(rows);

      final List<StudentSchedule> loadedSchedules = [];

      for (int i = 0; i < scheduleList.length; i++) {
        var id = scheduleList[i]['id'];
        var scheduleDetailId = scheduleList[i]['scheduleDetailId'];
        var studentRequest = scheduleList[i]['studentRequest'];
        var tutorReview = scheduleList[i]['tutorReview'];
        var showRecordUrl = scheduleList[i]['showRecordUrl'];
        var recordUrl = scheduleList[i]['recordUrl'];
        var scheduleDetailInfo = scheduleList[i]['scheduleDetailInfo'];
        var startDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo['startPeriodTimestamp']);
        var endDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo['endPeriodTimestamp']);
        var startTime = DateFormat("HH:mm").format(startDateTime);
        var endTime = DateFormat("HH:mm").format(endDateTime);
        var date = DateFormat("dd/MM/yyyy").format(startDateTime);
        var scheduleInfo = scheduleDetailInfo['scheduleInfo'];
        var tutorInfo = scheduleInfo['tutorInfo'];
        var tutorName = tutorInfo['name'];
        var tutorAvatar = tutorInfo['avatar'];
        var tutorCountry = tutorInfo['country'];
        String studentMeetingLink = scheduleList[i]['studentMeetingLink'];
        var studentMeetingLinkLength = studentMeetingLink.length;
        var token = studentMeetingLink.substring(13,
            studentMeetingLinkLength); // get subString from BE: "/call/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";

        loadedSchedules.add(StudentSchedule(
          id: id,
          scheduleDetailId: scheduleDetailId,
          tutorName: tutorName,
          tutorAvatar: tutorAvatar,
          tutorCountry: tutorCountry,
          startTime: startTime,
          endTime: endTime,
          date: date,
          startTimeDateTime: startDateTime,
          endTimeDateTime: endDateTime,
          studentRequest: studentRequest,
          tutorReview: tutorReview,
          showRecordUrl: showRecordUrl,
          recordUrl: recordUrl,
          meetingToken: token,
        ));
      }
      print(scheduleList.length);
      return loadedSchedules;
      // notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchSchedules(int pageNumber, [bool isBegin = false]) async {
    if (pageNumber <= totalPages) {
      var loadedSchedules = await fetchStudentSchedules(pageNumber);
      if (isBegin) {
        totalPages = countTotalPage(totalRecords, pageSize);
        print("totalPages: " + totalPages.toString());
        _scheduleList = loadedSchedules;
      } else {
        if (pageNumber == 1 && _totalRecords > 0) {
          _scheduleList.clear();
        }
        _scheduleList.addAll(loadedSchedules);
      }
      print("_scheduleList" + _scheduleList.length.toString());
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

  Future<void> fetchStudentSchedulesHistory() async {
    DateTime thirtyfiveMinutesAgoFromNow =
        DateTime.now().subtract(const Duration(minutes: 35)); //DateTime
    String timestamp =
        thirtyfiveMinutesAgoFromNow.millisecondsSinceEpoch.toString();
    // print("timestamp: " + timestamp);
    var url = Uri.parse(
        '${base_url}/booking/list/student?page=1&perPage=20&orderBy=meeting&dateTimeLte=${timestamp}&sortBy=desc');
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json"
    };
    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      var data = extractedData["data"];
      var rows = data['rows'];
      var scheduleList = List.from(rows);

      final List<StudentSchedule> loadedSchedules = [];

      for (int i = 0; i < scheduleList.length; i++) {
        var id = scheduleList[i]['id'];
        var scheduleDetailId = scheduleList[i]['scheduleDetailId'];
        var studentRequest = scheduleList[i]['studentRequest'];
        var tutorReview = scheduleList[i]['tutorReview'];
        var showRecordUrl = scheduleList[i]['showRecordUrl'];
        var recordUrl = scheduleList[i]['recordUrl'];
        var scheduleDetailInfo = scheduleList[i]['scheduleDetailInfo'];
        var startDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo['startPeriodTimestamp']);
        var endDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo['endPeriodTimestamp']);
        var startTime = DateFormat("HH:mm").format(startDateTime);
        var endTime = DateFormat("HH:mm").format(endDateTime);
        var date = DateFormat("dd/MM/yyyy").format(startDateTime);
        var scheduleInfo = scheduleDetailInfo['scheduleInfo'];
        var tutorInfo = scheduleInfo['tutorInfo'];
        var tutorName = tutorInfo['name'];
        var tutorAvatar = tutorInfo['avatar'];
        var tutorCountry = tutorInfo['country'];
        String studentMeetingLink = scheduleList[i]['studentMeetingLink'];
        var studentMeetingLinkLength = studentMeetingLink.length;
        var token = studentMeetingLink.substring(13,
            studentMeetingLinkLength); // get subString from BE: "/call/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...";

        // print("--------");
        // print(id);
        // print(scheduleDetailId);
        // print(tutorName);
        // print(tutorAvatar);
        // print(tutorCountry);
        // print(startTime);
        // print(endTime);
        // print(date);
        // print(studentRequest);
        // print("--------");
        loadedSchedules.add(StudentSchedule(
          id: id,
          scheduleDetailId: scheduleDetailId,
          tutorName: tutorName,
          tutorAvatar: tutorAvatar,
          tutorCountry: tutorCountry,
          startTime: startTime,
          endTime: endTime,
          date: date,
          startTimeDateTime: startDateTime,
          endTimeDateTime: endDateTime,
          studentRequest: studentRequest,
          tutorReview: tutorReview,
          showRecordUrl: showRecordUrl,
          recordUrl: recordUrl,
          meetingToken: token,
        ));
      }
      print(scheduleList.length);
      _scheduleListHistory = loadedSchedules;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<String> cancelBookingClass(String scheduleDetailId) async {
    final url = Uri.parse('${base_url}/booking');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authToken}"
    };
    final List<String> data = [];
    data.add(scheduleDetailId);
    // print(data);
    try {
      final response = await http.delete(
        url,
        headers: headers,
        body: json.encode(
          {
            'scheduleDetailIds': data,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        print("booking failed");
        print(responseData['message']);
        // await fetchStudentSchedules();
        return responseData['message'];
      }

      print("booking success");
      _scheduleList.removeWhere(
          (schedule) => schedule.scheduleDetailId == scheduleDetailId);
      _totalRecords--;
      notifyListeners();
      return responseData['message'];
    } catch (error) {
      // throw (error);
      print("booking failed error");
      return error;
    }
  }
}
