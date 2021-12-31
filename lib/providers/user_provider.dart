import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lettutor/models/user.dart';

class UserProvider with ChangeNotifier {
  final String authToken;

  UserProvider(this.authToken);

  User get userInfo {
    return _user;
  }

  User _user;

  Future<void> fetchUserInfo() async {
    var url = Uri.parse('https://sandbox.api.lettutor.com/user/info');
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
}
