import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/screens/CourseDetail/course_detail_screen.dart';

class CardCourse extends StatelessWidget {
  const CardCourse({
    Key key,
    @required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CourseDetailScreen(
              course: course,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
          // margin: EdgeInsets.symmetric(
          //   vertical: 8,
          //   horizontal: 8,
          // ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            // padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(course.imageUrl),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  course.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              child: Text(
                                course.description,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  levelToString(int.parse(course.level)),
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String levelToString(int level) {
    if (level == 0) {
      return "Any Level";
    } else if (level == 1) {
      return "Beginner";
    } else if (level == 2) {
      return "Post Beginner";
    } else if (level == 3) {
      return "Pre-Intermediate";
    } else if (level == 4) {
      return "Intermediate";
    }
    return "Super Advanced";
  }
}
