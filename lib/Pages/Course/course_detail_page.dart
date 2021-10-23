import 'package:flutter/material.dart';
import 'package:lettutor/Pages/Course/part_divider.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';

class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Detail")),
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
                      Text(
                        "Basic Conversation Topics",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                PartDivider(text: "Overview"),
                Row(
                  children: [
                    Icon(Icons.help_outline, color: Colors.red, size: 20.0),
                    SizedBox(width: 5),
                    Text(
                      "Why you should join this course:",
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
                      "What you can do:",
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
                PartDivider(text: "Level required"),
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
                PartDivider(text: "Course duration"),
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
                PartDivider(text: "Topic list"),
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
                      text: "Explore",
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
}
