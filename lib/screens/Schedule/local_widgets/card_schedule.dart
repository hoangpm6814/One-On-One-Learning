import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';
import 'package:lettutor/models/student_schedule.dart';
import 'package:lettutor/providers/student_schedule_provider.dart';
import 'package:lettutor/screens/Chat/chat_detail_screen.dart';
import 'package:lettutor/screens/VideoConference/video_conference_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final StudentSchedule schedule;

  @override
  Widget build(BuildContext context) {
    // final Tutor tutor =
    //     Provider.of<TutorProvider>(context).getById(schedule.tutorId);
    final now = DateTime.now();
    bool canDelete = schedule.startTimeDateTime.difference(now).inHours > 2;
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
                        Text("1 " + AppLocalizations.of(context).lesson),
                      ],
                    ),
                  ),
                  canDelete
                      ? ElevatedButton(
                          child: Row(
                            children: [
                              Icon(Icons.cancel, color: Colors.red, size: 20.0),
                              SizedBox(width: 5),
                              Text(
                                AppLocalizations.of(context).cancel,
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            // Provider.of<ScheduleProvider>(context, listen: false)
                            //     .removeSchedule(schedule.id);
                            String message = await Provider.of<
                                        StudentScheduleProvider>(context,
                                    listen: false)
                                .cancelBookingClass(schedule.scheduleDetailId);
                            var snackBar = SnackBar(
                              content: Text(message),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).scaffoldBackgroundColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : Container(),
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
                      Text("Viet Nam"),
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
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).edit_requirement,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: kPrimaryColor, size: 15.0),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    child: Text(
                      schedule.studentRequest ??
                          AppLocalizations.of(context).no_request_for_lesson,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LightRoundedButtonMediumPadding(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoConferenceScreen(
                          schedule: schedule,
                        ),
                      ),
                    );
                  },
                  color: kPrimaryColor,
                  textColor: Theme.of(context).scaffoldBackgroundColor,
                  text: AppLocalizations.of(context).enter_lesson,
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
}
