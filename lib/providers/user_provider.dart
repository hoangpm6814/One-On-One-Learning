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

  Future<String> becomeATutor(
    String name,
    String country,
    String birthday,
    String interests,
    String education,
    String experience,
    String profession,
    String languages,
    String bio,
    String targetStudent,
    String specialties,
    String price,
    String imagePath,
    String videoPath,
  ) async {
    final url = Uri.parse('${base_url}/tutor/register');
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authToken}"
    };

    try {
      final multipartRequest = new http.MultipartRequest('POST', url);
      multipartRequest.headers.addAll(headers);
      multipartRequest.fields['name'] = name;
      multipartRequest.fields['country'] = country;
      multipartRequest.fields['birthday'] = birthday;
      multipartRequest.fields['interests'] = interests;
      multipartRequest.fields['education'] = education;
      multipartRequest.fields['experience'] = experience;
      multipartRequest.fields['profession'] = profession;
      multipartRequest.fields['languages'] = languages;
      multipartRequest.fields['bio'] = bio;
      multipartRequest.fields['targetStudent'] = targetStudent;
      multipartRequest.fields['specialties'] = specialties;
      multipartRequest.fields['price'] = price;
      var multipartFile =
          await http.MultipartFile.fromPath("avatar", imagePath);
      multipartRequest.files.add(multipartFile);
      var multipartFile2 =
          await http.MultipartFile.fromPath("video", videoPath);
      multipartRequest.files.add(multipartFile2);

      // await multipartRequest.send().then((response) {
      //   var response2 = await http.Response.fromStream(response);
      //   if (response.statusCode >= 400) {
      //     print("Failed!");
      //     // print(response.stream.bytesToString());
      //     print("Received streamedResponse.statusCode:${response.statusCode}");
      //     response.stream.toStringStream();
      //     response.stream.listen((data) {
      //       print("Received data:$data");
      //     });
      //     // return response.stream.bytesToString();
      //     return "User has already been a tutor";
      //   } else if (response.statusCode == 200) {
      //     print("Uploaded!");
      //     // return response.stream.bytesToString();
      //   }
      // });
      var response = await multipartRequest.send();
      var response2 = await http.Response.fromStream(response);
      final responseData = json.decode(response2.body);
      if (response.statusCode >= 400) {
        print("failed");
        print(responseData['message']);
        // await fetchStudentSchedules();
        return responseData['message'];
      } else if (response.statusCode == 200) {
        print("Uploaded!");
        return "Successfully register to become a tutor."; // data response with body tutor detail
        // return response.stream.bytesToString();
      }

      return 'Error to come. Check your form again.';
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
