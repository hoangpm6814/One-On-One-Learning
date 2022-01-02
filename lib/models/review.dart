import 'package:flutter/foundation.dart';

class Review {
  final String id;
  final String firstId;
  final String secondId;
  final int rating;
  final String content;
  String createdAt;
  String updatedAt;

  Review({
    @required this.id,
    @required this.firstId,
    @required this.secondId,
    @required this.rating,
    @required this.content,
    this.createdAt = null,
    this.updatedAt = null,
  });
}
