import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

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
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                // borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          child: Text(
            "Go to class",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
