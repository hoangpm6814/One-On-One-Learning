import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';

class TutorDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                width: 150,
                child: Text(
                  "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Language",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        SpecialityButtonClickable(
          text: "English",
          isChosen: true,
        ),
        // SizedBox(height: 10),
        Text(
          "Education",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text(
            "Bachelor from University of Technology",
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Experience",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text(
            "5 years of English teaching experience",
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Interests",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text(
            "Finance, gardening, travelling",
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Profession",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Container(
            // width: 150,
            child: Text(
              "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Specialties",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SpecialityButtonClickable(
                text: "Conversational",
                isChosen: true,
              ),
              SizedBox(width: 5),
              SpecialityButtonClickable(
                text: "English for Business",
                isChosen: true,
              ),
              SizedBox(width: 5),
              SpecialityButtonClickable(
                text: "English for kids",
                isChosen: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
