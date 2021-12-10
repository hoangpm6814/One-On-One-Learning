import 'package:flutter/foundation.dart';

class Tutor {
  final String id;
  final String name;
  final double rating;
  final String avatar;
  final String description;
  final String nation;
  bool isFavourite;
  List<String> languages;
  final String education;
  final String experience;
  final String interest;
  final String profession;
  List<String> specialties;

  Tutor({
    @required this.id,
    @required this.name,
    @required this.rating,
    @required this.avatar,
    @required this.description,
    @required this.nation,
    @required this.education,
    @required this.experience,
    @required this.interest,
    @required this.profession,
    this.isFavourite = false,
    this.languages = null,
    this.specialties = null,
  });
}
