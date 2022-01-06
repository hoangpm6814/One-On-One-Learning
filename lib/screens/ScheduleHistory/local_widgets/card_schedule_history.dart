import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/student_schedule.dart';
import 'package:lettutor/screens/Chat/chat_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardScheduleHistory extends StatelessWidget {
  const CardScheduleHistory({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final StudentSchedule schedule;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('EEE, MMM d, yyyy')
                              .format(schedule.startTimeDateTime),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          // dateDiff(schedule.startTimeDateTime) +
                          //     " " +
                          //     AppLocalizations.of(context).days_ago,
                          getTimeDiff(schedule.endTimeDateTime),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(schedule.tutorAvatar),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        schedule.tutorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(schedule.tutorCountry),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatDetailScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat,
                              color: kPrimaryColor,
                              size: 20.0,
                            ),
                            SizedBox(width: 3),
                            Text(
                              AppLocalizations.of(context).chat,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                        AppLocalizations.of(context).lesson_time +
                            " " +
                            getStringShiftFromShift(schedule),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).lesson_requirement,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    child: Text(
                      schedule.studentRequest ?? "No request for lesson",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).tutor_judgement,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    child: Text(
                      schedule.tutorReview ?? "Tutor haven't reviewed yet",
                      // "Tutor haven't reviewed yet",
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  String getStringShiftFromShift(StudentSchedule schedule) {
    return "${schedule.startTime} - ${schedule.endTime}";
  }

  String dateDiff(DateTime date) {
    final DateTime now = DateTime.now();
    return now.difference(date).inDays.toString();
  }

  String getTimeDiff(DateTime time) {
    if (DateTime.now().difference(time).inMinutes < 2) {
      return "a few seconds ago";
    } else if (DateTime.now().difference(time).inMinutes < 60) {
      return "${DateTime.now().difference(time).inHours} mins ago";
    } else if (DateTime.now().difference(time).inMinutes < 1440) {
      return "${DateTime.now().difference(time).inHours} hours ago";
    } else if (DateTime.now().difference(time).inMinutes > 1440) {
      return "${DateTime.now().difference(time).inDays} days ago";
    }
    return "${DateTime.now().difference(time).inDays} days ago";
  }
}
