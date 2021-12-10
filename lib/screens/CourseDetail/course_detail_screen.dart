import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lettutor/api/pdf_api.dart';
import 'package:lettutor/screens/CourseDetail/local_widgets/part_divider.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/CourseDetail/pdf_viewer_screen.dart';

class CourseDetailScreen extends StatelessWidget {
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
                          AppLocalizations.of(context).course_title_1,
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
                          "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
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
                          "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
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
                      "Beginner",
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
                      "10 Topics",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                PartDivider(text: AppLocalizations.of(context).topic_list),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        child: Text(
                          "1. Foods You Love\n2. Your Job\n3. Playing and Watching Sports\n4. The Best Pet\n5. Having Fun in Your Free Time\n6. Your Daily Routine\n7. Childhood Memories\n8. Your Family Members\n9. Your Hometown\n10. Shopping Habits",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LightRoundedButtonMediumPadding(
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      text: AppLocalizations.of(context).explore,
                      press: () async {
                        // pdf from assets
                        final path =
                            'assets/files/Basic_Conversation_Topics.pdf';
                        final file = await PDFApi.loadAsset(path);
                        openPDF(context, file);

                        // pdf from network
                        // final url =
                        //     'https://www.cambridgeenglish.org/images/291264-learning-tips-pdf.pdf';
                        // final file = await PDFApi.loadNetwork(url);
                        // openPDF(context, file);
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
}
