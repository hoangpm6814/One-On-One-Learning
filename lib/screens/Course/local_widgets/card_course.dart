import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/screens/CourseDetail/course_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                                  levelToString(
                                      int.parse(course.level), context),
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
