import 'package:flutter/foundation.dart';

class User {
  final String name;
  final String country;
  final String phone;
  final String birthday;
  final String level;
  final String avatar;
  final String email;

  User({
    @required this.name,
    @required this.country,
    @required this.phone,
    @required this.birthday,
    @required this.level,
    @required this.avatar,
    @required this.email,
  });
}
