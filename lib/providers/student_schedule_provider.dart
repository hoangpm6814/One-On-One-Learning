import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/student_schedule.dart';
import 'dart:convert';

class StudentScheduleProvider with ChangeNotifier {
  final String authToken;
  List<StudentSchedule> _scheduleList = [];

  StudentScheduleProvider(this.authToken);

  List<StudentSchedule> get listSchedule {
    return [..._scheduleList];
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
          studentRequest: studentRequest,
        ));
      }
      print(scheduleList.length);
      _scheduleList = loadedSchedules;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
