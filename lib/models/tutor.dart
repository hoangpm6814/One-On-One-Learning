import 'package:flutter/foundation.dart';
import 'package:lettutor/models/review.dart';

class Tutor {
  final String id;
  final String name;
  final double rating;
  final String avatar;
  final String bio;
  final String country;
  bool isFavourite;
  String languages;
  final String education;
  final String experience;
  final String interests;
  final String profession;
  String specialties;
  String video;
  String targetStudent;
  bool isNative;
  bool isOnline;
  final int price;
  List<Review> reviews;

  Tutor({
    @required this.id,
    @required this.name,
    @required this.rating,
    @required this.avatar,
    @required this.bio,
    @required this.country,
    @required this.education,
    @required this.experience,
    @required this.interests,
    @required this.profession,
    this.isFavourite = false,
    this.languages = null,
    this.specialties = null,
    this.video = null,
    this.targetStudent = null,
    this.isNative = false,
    this.isOnline = false,
    @required this.price,
    this.reviews = const [],
  });
}
