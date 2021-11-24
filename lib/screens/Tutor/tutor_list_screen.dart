import 'package:flutter/material.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:lettutor/screens/Tutor/local_widgets/heading.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/tutor.dart';

class TutorListScreen extends StatelessWidget {
  static const routeName = '/tutor-list';

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
                0.21,
            padding: const EdgeInsets.all(15.0),
            color: kPrimaryColor,
            child: Heading(),
          ),
          tutors.isEmpty
              ? Container()
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.79,
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
