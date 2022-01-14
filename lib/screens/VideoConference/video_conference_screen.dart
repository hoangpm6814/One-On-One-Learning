import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/student_schedule.dart';

class VideoConferenceScreen extends StatefulWidget {
  static const routeName = '/video-conference';

  const VideoConferenceScreen({
    Key key,
    @required this.schedule,
  }) : super(key: key);

  final StudentSchedule schedule;

  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> {
  DateTime now = DateTime.now();
  DateTime startTime;
  Duration countDownDuration = Duration(minutes: 10);
  Duration countUpDuration;
  // Duration countDownDuration;
  Duration duration = Duration();
  Timer timer;

  bool isCountDown = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DateTime now = DateTime.now();

    DateTime startTime = widget.schedule.startTimeDateTime;
    print(startTime);
    print(now);
    isCountDown = startTime.isAfter(now);
    print(isCountDown);

    if (isCountDown) {
      int diffSeconds = startTime.difference(now).inSeconds;
      print("diffSeconds: " + diffSeconds.toString());
      countDownDuration = Duration(
        seconds: diffSeconds,
      );
    } else {
      int diffSeconds = now.difference(startTime).inSeconds;
      print("diffSeconds: " + diffSeconds.toString());
      countUpDuration = Duration(
        seconds: diffSeconds,
      );
    }

    startTimer();
    reset();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void reset() {
    if (isCountDown) {
      setState(() {
        duration = countDownDuration;
      });
    } else {
      setState(() {
        duration = countUpDuration;
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = isCountDown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        // timer.cancel();
        isCountDown = false;
        reset();
      } else {
        duration = Duration(seconds: seconds);
      }
      // duration = Duration(seconds: seconds);
    });
  }

  Widget buildTimeUp() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }

  Widget buildTimeDown() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$hours : $minutes : $seconds',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context).meeting_room,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !isCountDown
              ? Container(
                  height: 50,
                  // margin: EdgeInsets.symmetric(vertical: 40),
                  // padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).tutoring_meeting_room,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      buildTimeUp(),
                    ],
                  ),
                )
              : Container(
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // width: 100,
                        height: 80,
                        margin: EdgeInsets.symmetric(vertical: 100),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey[600]),
                          color: Color(0xFF26262b),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context).lesson_start_after,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            buildTimeDown(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/app_logo_oneonone.png",
                height: 90,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
