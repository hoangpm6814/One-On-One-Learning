import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/schedule_provider.dart';
import 'package:lettutor/screens/Schedule/local_widgets/card_schedule.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleListScreen extends StatefulWidget {
  static const routeName = '/schedule-list';

  @override
  State<StatefulWidget> createState() {
    return ScheduleListScreenState();
  }
}

class ScheduleListScreenState extends State<ScheduleListScreen> {
  // String _name;
  // String _country;

  @override
  Widget build(BuildContext context) {
    final schedules = Provider.of<ScheduleProvider>(context).listSchedule;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context).your_booked_schedules,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            schedules.length > 0
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).padding.bottom +
                                kToolbarHeight)) *
                        0.78,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return CardSchedule(
                          key: Key(schedules[index].id),
                          schedule: schedules[index],
                        );
                      },
                      itemCount: schedules.length,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context).no_upcoming_class,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            // CardSchedule(
            //   schedule: schedules[0],
            // ),
            // CardSchedule(
            //   schedule: schedules[1],
            // ),
            // CardSchedule(
            //   schedule: schedules[2],
            // ),
          ],
        ),
      ),
    );
  }
}
