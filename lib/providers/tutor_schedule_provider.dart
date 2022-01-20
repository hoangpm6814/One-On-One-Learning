import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lettutor/models/tutor_schedule.dart';

class TutorScheduleProvider with ChangeNotifier {
  final String authToken;
  List<TutorSchedule> _scheduleList = [];

  TutorScheduleProvider(this.authToken);

  List<TutorSchedule> get listSchedule {
    return [..._scheduleList];
  }

  Future<void> fetchTutorSchedules(String tutorId) async {
    var url = Uri.parse('${base_url}/schedule');
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json"
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'tutorId': tutorId,
          },
        ),
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      var data = extractedData["data"];
      var scheduleList = List.from(data);

      final List<TutorSchedule> loadedSchedules = [];

      for (int i = 0; i < scheduleList.length; i++) {
        var id = scheduleList[i]['id'];
        var scheduleDetails = scheduleList[i]['scheduleDetails'];
        var scheduleDetailList = List.from(scheduleDetails);
        var scheduleDetailId = scheduleDetailList[0]['id'];
        var startDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleList[i]['startTimestamp']);
        var endDateTime = new DateTime.fromMillisecondsSinceEpoch(
            scheduleList[i]['endTimestamp']);
        var startTime = DateFormat("HH:mm").format(startDateTime);
        var endTime = DateFormat("HH:mm").format(endDateTime);
        var date = DateFormat("dd/MM/yyyy").format(startDateTime);
        var isBooked = scheduleList[i]['isBooked'];
        print("--------");
        print(id);
        print(scheduleDetailId);
        print(startTime);
        print(endTime);
        print(date);
        print("--------");
        loadedSchedules.add(TutorSchedule(
          id: id,
          scheduleDetailId: scheduleDetailId,
          startTime: startTime,
          endTime: endTime,
          date: date,
          startTimeDateTime: startDateTime,
          isBooked: isBooked,
        ));
      }
      print(scheduleList.length);
      _scheduleList = loadedSchedules;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<String> bookingClass(String scheduleDetailId, String note) async {
    final url = Uri.parse('${base_url}/booking');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authToken}"
    };
    final List<String> data = [];
    data.add(scheduleDetailId);
    // print(data);
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'scheduleDetailIds': data,
            'note': note,
          },
        ),
      );
      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        print("booking failed");
        print(responseData['message']);
        return responseData['message'];
      }

      print("booking success");
      return responseData['message'];
    } catch (error) {
      // throw (error);
      print("booking failed error");
      return error;
    }
  }
}
