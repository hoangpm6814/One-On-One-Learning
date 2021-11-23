import 'package:flutter/material.dart';
import 'package:lettutor/screens/Schedule/local_widgets/card_schedule.dart';

class ScheduleListScreen extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text("View Schedule")),
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
                      "Your booked schedules:",
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
              CardSchedule(),
              CardSchedule(),
              CardSchedule(),
              CardSchedule(),
              CardSchedule(),
            ],
          ),
        ),
      ),
    );
  }
}
