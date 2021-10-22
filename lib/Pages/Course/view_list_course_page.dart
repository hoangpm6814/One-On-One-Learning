import 'package:flutter/material.dart';
import 'package:lettutor/Pages/Course/card_course.dart';

class ViewListCoursePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewListCoursePageState();
  }
}

class ViewListCoursePageState extends State<ViewListCoursePage> {
  // String _name;
  // String _country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Course")),
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
                          "English For Beginners:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
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
                          "Conversational English:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
                  SizedBox(height: 10),
                  CardCourse(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
