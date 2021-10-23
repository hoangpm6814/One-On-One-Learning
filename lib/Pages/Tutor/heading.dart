import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total lession time is 11 hours and 45 minutes",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        Text(
          "Upcoming lession",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        Text(
          "Wed, 24 Oct 6:30 - 6:55",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RoundedButtonSmallPadding(
          color: Colors.white,
          textColor: kPrimaryColor,
          text: "Go to class",
        )
      ],
    );
  }
}
