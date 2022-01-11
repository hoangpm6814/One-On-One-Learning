import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lettutor/models/http_exception.dart';
import 'package:lettutor/constants.dart';
import 'dart:convert';

import 'package:lettutor/models/user.dart';

class UserProvider with ChangeNotifier {
  final String authToken;

  UserProvider(this.authToken);

  User get userInfo {
    return _user;
  }

  int get totalTime {
    return _totalTime;
  }

  User _user;
  int _totalTime;

  Future<void> fetchUserInfo() async {
    var url = Uri.parse('${base_url}/user/info');
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json"
    };
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      var user = extractedData["user"];
      var name = user["name"];
      var country = user["country"];
      var phone = user["phone"];
      var birthday = user["birthday"];
      var level = user["level"];
      var avatar = user["avatar"];
      var email = user["email"];

      final User loadedUser = User(
        name: name,
        country: country,
        phone: phone,
        birthday: birthday,
        level: level,
        avatar: avatar,
        email: email,
      );

      _user = loadedUser;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> updateUserInfo(User user) async {
    final url = Uri.parse('${base_url}/user/info');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authToken}"
    };
    try {
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(
          {
            'name': user.name,
            'country': user.country,
            "phone": user.phone,
            "birthday": user.birthday,
            "level": user.level,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['message'] != null) {
        throw HttpException(responseData['message']);
      }
      var data = responseData['user'];
      var name = data['name'];
      var country = data['country'];
      var phone = data['phone'];
      var birthday = data['birthday'];
      var level = data['level'];
      var email = data['email'];
      var updatedUser = User(
        name: name,
        country: country,
        phone: phone,
        birthday: birthday,
        level: level,
        avatar: _user.avatar,
        email: email,
      );
      _user = updatedUser;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> fetchUserTotalTime() async {
    var url = Uri.parse('${base_url}/call/total');
    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken}",
      "Content-Type": "application/json"
    };
    try {
      final response = await http.get(url, headers: headers);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return 0;
      }
      var total = extractedData["total"];
      print(total);

      _totalTime = total;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
