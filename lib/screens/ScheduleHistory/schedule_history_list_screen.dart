import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/providers/student_schedule_provider.dart';
import 'package:lettutor/screens/ScheduleHistory/local_widgets/card_schedule_history.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleHistoryListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScheduleHistoryListScreenState();
  }
}

class ScheduleHistoryListScreenState extends State<ScheduleHistoryListScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StudentScheduleProvider>(context)
          .fetchStudentSchedulesHistory()
          .then((_) {
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
    final schedules =
        Provider.of<StudentScheduleProvider>(context).listScheduleHistory;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).schedule_history),
      ),
      body: _isLoading
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
                            AppLocalizations.of(context).your_schedule_history,
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
                                0.9,
                            child: ListView.builder(
                              itemBuilder: (ctx, index) {
                                return CardScheduleHistory(
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
                                    AppLocalizations.of(context)
                                        .no_history_schedule,
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
            ),
    );
  }
}
