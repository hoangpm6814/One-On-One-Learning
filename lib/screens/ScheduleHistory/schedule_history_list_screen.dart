import 'package:flutter/material.dart';
import 'package:lettutor/screens/ScheduleHistory/local_widgets/card_schedule_history.dart';

class ScheduleHistoryListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScheduleHistoryListScreenState();
  }
}

class ScheduleHistoryListScreenState extends State<ScheduleHistoryListScreen> {
  // String _name;
  // String _country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View History")),
      body: SingleChildScrollView(
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
                      "Your history of schedules:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: ListView.builder(
              //     itemBuilder: (ctx, index) {
              //       return CardTutor(tutor: tutors[index]);
              //     },
              //     itemCount: tutors.length,
              //   ),
              // ),
              CardScheduleHistory(),
              CardScheduleHistory(),
              CardScheduleHistory(),
              CardScheduleHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
