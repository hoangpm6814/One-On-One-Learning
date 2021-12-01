import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:lettutor/models/tutor.dart';

class TutorDescription extends StatelessWidget {
  const TutorDescription({
    Key key,
    @required this.tutor,
  }) : super(key: key);

  final Tutor tutor;
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
                  tutor.description,
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
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (var item in tutor.languages)
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: SpecialityButtonClickable(
                    text: item,
                    isChosen: true,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 10),
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
            tutor.education,
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
            tutor.experience,
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
            tutor.interest,
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
              tutor.profession,
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
              for (var item in tutor.specialties)
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: SpecialityButtonClickable(
                    text: item,
                    isChosen: true,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
