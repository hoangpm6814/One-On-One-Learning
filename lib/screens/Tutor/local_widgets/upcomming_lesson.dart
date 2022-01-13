import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/providers/student_schedule_provider.dart';
import 'package:provider/provider.dart';

class UpcommingLesson extends StatefulWidget {
  UpcommingLesson({Key key}) : super(key: key);

  @override
  _UpcommingLessonState createState() => _UpcommingLessonState();
}

class _UpcommingLessonState extends State<UpcommingLesson> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   Provider.of<StudentScheduleProvider>(context, listen: false)
    //       .fetchStudentSchedules()
    //       .then((_) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // }
    // _isInit = false;
    // super.didChangeDependencies();

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StudentScheduleProvider>(context, listen: false)
          .fetchStudentSchedules(1)
          .whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final lessons = Provider.of<StudentScheduleProvider>(context).listSchedule;
    // var firstLesson = lessons.firstWhere(
    //   (element) => element.endTimeDateTime.isAfter(DateTime.now()),
    //   orElse: () => StudentSchedule(
    //     id: "id",
    //     tutorName: "tutorName",
    //     tutorAvatar: "tutorAvatar",
    //     tutorCountry: "tutorCountry",
    //     scheduleDetailId: "scheduleDetailId",
    //     startTime: "08:00",
    //     endTime: "08:25",
    //     date: "date",
    //     startTimeDateTime: DateTime.now(),
    //     endTimeDateTime: DateTime.now(),
    //     studentRequest: "studentRequest",
    //     tutorReview: "tutorReview",
    //     showRecordUrl: false,
    //     recordUrl: "recordUrl",
    //   ),
    // );
    // String earliestLessonToShow =
    //     DateFormat("EEE, dd/MM/yyyy").format(firstLesson.startTimeDateTime) +
    //         " " +
    //         firstLesson.startTime +
    //         " - " +
    //         firstLesson.endTime;
    final firstLesson =
        Provider.of<StudentScheduleProvider>(context).earliestUpcommingLesson;

    String earliestLessonToShow =
        DateFormat("EEE, dd/MM/yyyy").format(firstLesson.startTimeDateTime) +
            " " +
            firstLesson.startTime +
            " - " +
            firstLesson.endTime;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Text(
            // "Wed, 24 Oct 6:30 - 6:55",
            earliestLessonToShow,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          );
  }
}
