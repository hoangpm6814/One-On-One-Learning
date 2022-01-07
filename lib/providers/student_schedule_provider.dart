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

  StudentScheduleProvider(this.authToken);

  List<StudentSchedule> get listSchedule {
    return [..._scheduleList];
  }

  List<StudentSchedule> get listScheduleHistory {
    return [..._scheduleListHistory];
  }

  Future<void> fetchStudentSchedules() async {
    DateTime fiveMinutesAgoFromNow =
        DateTime.now().subtract(const Duration(minutes: 5)); //DateTime
    String timestamp = fiveMinutesAgoFromNow.millisecondsSinceEpoch.toString();
    // print("timestamp: " + timestamp);
    var url = Uri.parse(
        '${base_url}/booking/list/student?page=1&perPage=20&dateTimeGte=${timestamp}&orderBy=meeting&sortBy=asc');
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

        print("--------");
        print(id);
        print(scheduleDetailId);
        print(tutorName);
        print(tutorAvatar);
        print(tutorCountry);
        print(startTime);
        print(endTime);
        print(date);
        print(studentRequest);
        print("--------");
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
        ));
      }
      print(scheduleList.length);
      _scheduleList = loadedSchedules;
      notifyListeners();
    } catch (error) {
      throw (error);
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

        print("--------");
        print(id);
        print(scheduleDetailId);
        print(tutorName);
        print(tutorAvatar);
        print(tutorCountry);
        print(startTime);
        print(endTime);
        print(date);
        print(studentRequest);
        print("--------");
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
        await fetchStudentSchedules();
        return responseData['message'];
      }

      print("booking success");
      _scheduleList.removeWhere(
          (schedule) => schedule.scheduleDetailId == scheduleDetailId);
      notifyListeners();
      return responseData['message'];
    } catch (error) {
      // throw (error);
      print("booking failed error");
      return error;
    }
  }
}
