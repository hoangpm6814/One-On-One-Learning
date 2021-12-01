import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/screens/Course/local_widgets/card_course.dart';

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
        title: Text("View Course"),
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
                          "English For Beginners:",
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
                    title: "Basic Conversation Topics (New)",
                    description:
                        'Gain confidence speaking about familiar topics',
                    level: "Beginner" + " - " + "10 Lessons",
                  ),
                  SizedBox(height: 10),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5e2b895e541a832674533c18?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: "Intermediate Conversation Topics (New)",
                    description: "Express your ideas and opinions",
                    level: "Intermediate" + " - " + "10 Lessons",
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
                          "Conversational English:",
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
                    title: "Healthy Mind, Healthy Body (New)",
                    description:
                        "Let's discuss the many aspects of living a long, happy life",
                    level: "Intermediate" + " - " + "6 Lessons",
                  ),
                  SizedBox(height: 10),
                  CardCourse(
                    avatar:
                        "https://camblycurriculumicons.s3.amazonaws.com/5eab4979c920a20f93071fdd?h=d41d8cd98f00b204e9800998ecf8427e",
                    title: "Movies and Television (New)",
                    description:
                        "Let's discuss our preferences and habits surrounding movies and television shows",
                    level: "Beginner" + " - " + "10 Lessons",
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
