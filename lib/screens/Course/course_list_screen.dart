import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/screens/Course/local_widgets/card_course.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CourseListScreenState();
  }
}

class CourseListScreenState extends State<CourseListScreen> {
  // String _name;
  // String _country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).course),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).english_for_beginners,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e2b99d0c4288f294426b643?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: AppLocalizations.of(context).course_title_1,
                    description:
                        AppLocalizations.of(context).course_description_1,
                    level: AppLocalizations.of(context).course_duration_1,
                  ),
                  SizedBox(height: 10),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e2b895e541a832674533c18?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: AppLocalizations.of(context).course_title_2,
                    description:
                        AppLocalizations.of(context).course_description_2,
                    level: AppLocalizations.of(context).course_duration_2,
                  ),
                  // SizedBox(height: 10),
                  // CardCourse(),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).conversational_english,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a4c05342470fdddf8b8?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: AppLocalizations.of(context).course_title_3,
                    description:
                        AppLocalizations.of(context).course_description_3,
                    level: AppLocalizations.of(context).course_duration_3,
                  ),
                  SizedBox(height: 10),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5eab4979c920a20f93071fdd?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: AppLocalizations.of(context).course_title_4,
                    description:
                        AppLocalizations.of(context).course_description_4,
                    level: AppLocalizations.of(context).course_duration_4,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
