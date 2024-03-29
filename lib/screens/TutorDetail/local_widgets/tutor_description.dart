import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorDescription extends StatelessWidget {
  const TutorDescription({
    Key key,
    @required this.tutor,
  }) : super(key: key);

  final Tutor tutor;
  @override
  Widget build(BuildContext context) {
    List<String> tutorLanguages = tutor.languages.split(',');
    List<String> tutorSpecialties = tutor.specialties.split(',');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                width: 150,
                child: Text(
                  tutor.bio,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          AppLocalizations.of(context).language,
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
              for (var item in tutorLanguages)
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
          AppLocalizations.of(context).education,
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
          AppLocalizations.of(context).experience,
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
          AppLocalizations.of(context).interests,
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text(
            tutor.interests,
          ),
        ),
        SizedBox(height: 10),
        Text(
          AppLocalizations.of(context).profession,
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
          AppLocalizations.of(context).specialties,
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
              for (var item in tutorSpecialties)
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
