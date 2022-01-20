import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lettutor/api/pdf_api.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/screens/CourseDetail/local_widgets/part_divider.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/CourseDetail/pdf_viewer_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({
    Key key,
    @required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).course_detail),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          course.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                PartDivider(text: AppLocalizations.of(context).overview),
                Row(
                  children: [
                    Icon(Icons.help_outline, color: Colors.red, size: 20.0),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)
                            .why_you_should_join_this_course,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        child: Text(
                          course.reason,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.red, size: 20.0),
                    SizedBox(width: 5),
                    Text(
                      AppLocalizations.of(context).what_you_can_do,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        child: Text(
                          course.purpose,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 30),
                PartDivider(text: AppLocalizations.of(context).level_required),
                Row(
                  children: [
                    Icon(
                      Icons.person_add_rounded,
                      color: kPrimaryColor,
                      size: 20.0,
                    ),
                    SizedBox(width: 5),
                    Text(
                      levelToString(int.parse(course.level), context),
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                PartDivider(text: AppLocalizations.of(context).course_duration),
                Row(
                  children: [
                    Icon(
                      Icons.list_alt,
                      color: kPrimaryColor,
                      size: 20.0,
                    ),
                    SizedBox(width: 5),
                    Text(
                      course.topics.length.toString() +
                          " " +
                          AppLocalizations.of(context).topics,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                PartDivider(text: AppLocalizations.of(context).topic_list),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < course.topics.length; i++)
                      Text((i + 1).toString() + ") " + course.topics[i].name)
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LightRoundedButtonMediumPadding(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      text: AppLocalizations.of(context).explore,
                      press: () async {
                        // pdf from assets
                        // final path =
                        //     'assets/files/Basic_Conversation_Topics.pdf';
                        // final file = await PDFApi.loadAsset(path);
                        // openPDF(context, file);

                        // pdf from network
                        final url = course.topics[0].nameFile;
                        final file = await PDFApi.loadNetwork(url);
                        openPDF(context, file);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerScreen(file: file)),
      );

  String levelToString(int level, BuildContext context) {
    if (level == 0) {
      return AppLocalizations.of(context).any_level;
    } else if (level == 1) {
      return AppLocalizations.of(context).beginner;
    } else if (level == 2) {
      return AppLocalizations.of(context).higher_beginner;
    } else if (level == 3) {
      return AppLocalizations.of(context).pre_intermediate;
    } else if (level == 4) {
      return AppLocalizations.of(context).intermediate;
    } else if (level == 5) {
      return AppLocalizations.of(context).upper_intermediate;
    } else if (level == 6) {
      return AppLocalizations.of(context).advanced;
    }
    return AppLocalizations.of(context).proficiency;
  }
}
