import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:lettutor/models/tutor.dart';

class SearchTutorListScreen extends StatelessWidget {
  static const routeName = '/search-tutor-list';

  final List<Tutor> tutors = DUMMY_TUTORS;

  // ListTutor(this.tutors);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                0.1,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            // color: k2PrimaryColor,
            child: Scaffold(
              body: Container(
                width: double.infinity,
                child: RoundedInputField(
                  icon: Icons.search,
                  hintText: "Type to find tutor",
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                0.07,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            // color: k2PrimaryColor,
            child: Scaffold(
              body: Container(
                // width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SpecialityButtonClickable(
                      text: "All",
                      isChosen: true,
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "English for kids",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "English for Business",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "Conversational",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "STARTERS",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "MOVERS",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "FLYERS",
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          tutors.isEmpty
              ? Container()
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.62,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CardTutor(tutor: tutors[index]);
                    },
                    itemCount: tutors.length,
                  ),
                ),
        ],
      ),
    );
  }
}
