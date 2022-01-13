import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/providers/student_schedule_provider.dart';
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
  var _isInit = true;
  var _isLoading = false;
  int _page = 1;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    var scheduleProvider =
        Provider.of<StudentScheduleProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        scheduleProvider.fetchSchedules(++_page);
      }
    });
  }

  @override
  void didChangeDependencies() {
    print(_isInit);
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StudentScheduleProvider>(context).fetchSchedules(1).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<StudentScheduleProvider>(context);
    final schedules = scheduleProvider.listSchedule;
    final scheduleLength = scheduleProvider.listSchedule.length;
    print("scheduleLength: " + scheduleLength.toString());
    final totalRecords = scheduleProvider.totalRecords;
    print("totalRecords: " + totalRecords.toString());
    print("schedules: " + schedules.length.toString());
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
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
                          // child: ListView.builder(
                          //   controller: _scrollController,
                          //   // shrinkWrap: true,
                          //   // physics: const AlwaysScrollableScrollPhysics(),
                          //   itemBuilder: (ctx, index) {
                          //     if ((index == scheduleLength - 1) &&
                          //         scheduleLength < totalRecords) {
                          //       return Center(
                          //           child: CircularProgressIndicator());
                          //     }
                          //     return CardSchedule(
                          //       key: Key(schedules[index].id),
                          //       schedule: schedules[index],
                          //     );
                          //   },
                          //   itemCount: schedules.length,
                          // ),
                          child: ListView(
                            controller: _scrollController,
                            children: [
                              ...schedules.map(
                                (schedule) => CardSchedule(
                                  key: Key(schedule.id),
                                  schedule: schedule,
                                ),
                              ),
                              if (scheduleLength < totalRecords)
                                Center(child: CircularProgressIndicator()),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)
                                      .no_upcoming_class,
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
                ],
              ),
            ),
          );
  }
}
