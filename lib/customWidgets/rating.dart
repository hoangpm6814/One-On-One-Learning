import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    if (rating < 1) {
      return Row(
        children: [
          Icon(Icons.star_half, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating > 1 && rating < 2) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_half, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating > 2 && rating < 3) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_half, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating > 3 && rating < 4) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_half, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating > 4 && rating < 5) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_half, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating == 1) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating == 2) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating == 3) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else if (rating == 4) {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star_outline, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
          Icon(Icons.star, color: kPrimaryRatingStar, size: 20.0),
        ],
      );
    }
  }
}
