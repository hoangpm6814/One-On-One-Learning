import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_provider.dart';
import 'package:lettutor/screens/Chat/chat_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardScheduleHistory extends StatelessWidget {
  const CardScheduleHistory({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    final Tutor tutor =
        Provider.of<TutorProvider>(context).getById(schedule.tutorId);
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
                          DateFormat('EEE, MMM d, yyyy').format(schedule.date),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          dateDiff(schedule.date) +
                              " " +
                              AppLocalizations.of(context).days_ago,
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
                      backgroundImage: NetworkImage(tutor.avatar),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tutor.name,
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
                            getTimeShift(schedule.shift),
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
                      schedule.requirement,
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
                      'Actually, your English is very well. There are just few aspects that you need to improve. Hope you are doing better next time.',
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

  String getTimeShift(int shift) {
    switch (shift) {
      case 1:
        return "08:00 - 09:30";
      case 2:
        return "09:30 - 11:00";
      case 3:
        return "13:30 - 15:00";
      case 4:
        return "15:00 - 16:30";
      case 5:
        return "20:00 - 21:30";
      case 6:
        return "21:30 - 23:00";
      default:
        return "21:30 - 23:00";
    }
  }

  String dateDiff(DateTime date) {
    final DateTime now = DateTime.now();
    return now.difference(date).inDays.toString();
  }
}
