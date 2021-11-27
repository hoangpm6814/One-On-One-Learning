import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor_provider.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:lettutor/screens/Tutor/local_widgets/heading.dart';
import 'package:lettutor/constants.dart';
import 'package:provider/provider.dart';

class TutorListScreen extends StatelessWidget {
  static const routeName = '/tutor-list';

  @override
  Widget build(BuildContext context) {
    final tutors = Provider.of<TutorProvider>(context).listTutor;
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).padding.bottom +
                        kToolbarHeight)) *
                0.2,
            padding: const EdgeInsets.all(15.0),
            color: kPrimaryColor,
            child: Heading(),
          ),
          tutors.isEmpty
              ? Container()
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).padding.top +
                              MediaQuery.of(context).padding.bottom +
                              kToolbarHeight)) *
                      0.63,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
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
