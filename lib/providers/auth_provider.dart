import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/http_exception.dart';

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  // String get userId {
  //   return _userId;
  // }

  Future<void> login(String email, String password) async {
    print("Go authen func, email: " + email);
    print("Go authen func, password: " + password);
    final url = Uri.parse('https://sandbox.api.lettutor.com/auth/login');
    Map<String, String> headers = {"Content-Type": "application/json"};
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['message'] != null) {
        throw HttpException(responseData['message']);
      }
      _token = responseData['tokens']['access']['token'];
      _userId = responseData['user']['id'];
      // _expiryDate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(
      //       responseData['expiresIn'],
      //     ),
      //   ),
      _expiryDate = DateTime.parse(responseData['tokens']['access']['expires']);

      print(_token);

      // _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }
  // Login success !!!

  Future<void> signup(String email, String password) async {}

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }
}
