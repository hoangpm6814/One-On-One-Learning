import 'package:flutter/material.dart';
import 'package:lettutor/Pages/Schedule/card_schedule.dart';

class ViewListSchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewListSchedulePageState();
  }
}

class ViewListSchedulePageState extends State<ViewListSchedulePage> {
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
