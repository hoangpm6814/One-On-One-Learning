import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/feature_flag/feature_flag.dart';
// import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
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

  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "plugintestroom");
  final subjectText = TextEditingController(
      text:
          "Tutoring meeting room:"); // show in the top of the meeting before timer
  final nameText = TextEditingController(text: "Plugin Test User");
  final emailText = TextEditingController(text: "fake@email.com");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = true;
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
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
    JitsiMeet.removeAllListeners();
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
          ElevatedButton(
            onPressed: () {
              _joinMeeting();
            },
            child: Text(
              "Enter class",
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

  // _onAudioOnlyChanged(bool value) {
  //   setState(() {
  //     isAudioOnly = value;
  //   });
  // }

  // _onAudioMutedChanged(bool value) {
  //   setState(() {
  //     isAudioMuted = value;
  //   });
  // }

  // _onVideoMutedChanged(bool value) {
  //   setState(() {
  //     isVideoMuted = value;
  //   });
  // }

  _joinMeeting() async {
    String serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    featureFlags[FeatureFlagEnum.INVITE_ENABLED] = false;
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // FeatureFlag featureFlag = FeatureFlag();
    // featureFlag.welcomePageEnabled = false;
    // featureFlag.inviteEnabled = false;
    // // Here is an example, disabling features for each platform
    // if (Platform.isAndroid) {
    //   // Disable ConnectionService usage on Android to avoid issues (see README)
    //   featureFlag.callIntegrationEnabled = false;
    // } else if (Platform.isIOS) {
    //   // Disable PIP on iOS as it looks weird
    //   featureFlag.pipEnabled = false;
    // }
    // Define meetings options here
    var options = JitsiMeetingOptions(
        room:
            "f569c202-7bbf-4620-af77-ecc1419a6b28-4d54d3d7-d2a9-42e5-97a2-5ed38af5789a")
      ..serverURL = "https://meet.lettutor.com"
      ..subject = subjectText.text
      ..userDisplayName = nameText.text
      ..userEmail = "student@lettutor.com"
      ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      // ..featureFlags = featureFlag as Map<FeatureFlagEnum, bool>
      ..token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250ZXh0Ijp7InVzZXIiOnsiZW1haWwiOiJzdHVkZW50QGxldHR1dG9yLmNvbSIsIm5hbWUiOiJIZWxsbyBLaXR0eSJ9fSwicm9vbSI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOC00ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWEiLCJyb29tTmFtZSI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOC00ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWEiLCJ1c2VyQ2FsbCI6eyJpZCI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOCIsImVtYWlsIjoic3R1ZGVudEBsZXR0dXRvci5jb20iLCJuYW1lIjoiSGVsbG8gS2l0dHkiLCJhdmF0YXIiOiJodHRwczovL3NhbmRib3guYXBpLmxldHR1dG9yLmNvbS9hdmF0YXIvZjU2OWMyMDItN2JiZi00NjIwLWFmNzctZWNjMTQxOWE2YjI4YXZhdGFyMTY0MjU2NjMwODk5NS5wbmciLCJjb3VudHJ5IjoiVk4iLCJwaG9uZSI6Ijg0MjQ5OTk5NjUwOCIsImxhbmd1YWdlIjoiVmlldG5hbWVzZSIsImJpcnRoZGF5IjoiMTk5OS0wNi0wNSIsImlzQWN0aXZhdGVkIjp0cnVlLCJyZXF1aXJlTm90ZSI6bnVsbCwibGV2ZWwiOiJBRFZBTkNFRCIsImlzUGhvbmVBY3RpdmF0ZWQiOnRydWUsInRpbWV6b25lIjo3fSwidXNlckJlQ2FsbGVkIjp7ImlkIjoiNGQ1NGQzZDctZDJhOS00MmU1LTk3YTItNWVkMzhhZjU3ODlhIiwiZW1haWwiOiJ0ZWFjaGVyQGxldHR1dG9yLmNvbSIsIm5hbWUiOiJLZWVnYW4iLCJhdmF0YXIiOiJodHRwczovL2FwaS5hcHAubGV0dHV0b3IuY29tL2F2YXRhci80ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWFhdmF0YXIxNjI3OTEzMDE1ODUwLjAwIiwiY291bnRyeSI6IlZFIiwicGhvbmUiOiIwMzI5NzEzODgiLCJsYW5ndWFnZSI6bnVsbCwiYmlydGhkYXkiOiIxOTk5LTEyLTAxIiwiaXNBY3RpdmF0ZWQiOnRydWUsInR1dG9ySW5mbyI6eyJpZCI6IjZjYTVjMDkyLTc2ZWEtNGU3Mi05YzZlLTA1ZTIyMzlhYTMzYiIsInVzZXJJZCI6IjRkNTRkM2Q3LWQyYTktNDJlNS05N2EyLTVlZDM4YWY1Nzg5YSIsInZpZGVvIjoiaHR0cHM6Ly9hcGkuYXBwLmxldHR1dG9yLmNvbS92aWRlby80ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWF2aWRlbzE2Mjc5MTMwMTU4NzEubXA0IiwiYmlvIjoiSSBhbSBwYXNzaW9uYXRlIGFib3V0IHJ1bm5pbmcgYW5kIGZpdG5lc3MsIEkgb2Z0ZW4gY29tcGV0ZSBpbiB0cmFpbC9tb3VudGFpbiBydW5uaW5nIGV2ZW50cyBhbmQgSSBsb3ZlIHB1c2hpbmcgbXlzZWxmLiBJIGFtIHRyYWluaW5nIHRvIG9uZSBkYXkgdGFrZSBwYXJ0IGluIHVsdHJhLWVuZHVyYW5jZSBldmVudHMuIEkgYWxzbyBlbmpveSB3YXRjaGluZyBydWdieSBvbiB0aGUgd2Vla2VuZHMsIHJlYWRpbmcgYW5kIHdhdGNoaW5nIHBvZGNhc3RzIG9uIFlvdXR1YmUuIE15IG1vc3QgbWVtb3JhYmxlIGxpZmUgZXhwZXJpZW5jZSB3b3VsZCBiZSBsaXZpbmcgaW4gYW5kIHRyYXZlbGluZyBhcm91bmQgU291dGhlYXN0IEFzaWEuIiwiZWR1Y2F0aW9uIjoiQkEiLCJleHBlcmllbmNlIjoiSSBoYXZlIG1vcmUgdGhhbiAxMCB5ZWFycyBvZiB0ZWFjaGluZyBlbmdsaXNoIGV4cGVyaWVuY2UiLCJwcm9mZXNzaW9uIjoiRW5nbGlzaCB0ZWFjaGVyIiwiYWNjZW50IjpudWxsLCJ0YXJnZXRTdHVkZW50IjoiSW50ZXJtZWRpYXRlIiwiaW50ZXJlc3RzIjoiIEkgbG92ZWQgdGhlIHdlYXRoZXIsIHRoZSBzY2VuZXJ5IGFuZCB0aGUgbGFpZC1iYWNrIGxpZmVzdHlsZSBvZiB0aGUgbG9jYWxzLiIsImxhbmd1YWdlcyI6ImVuIiwic3BlY2lhbHRpZXMiOiJidXNpbmVzcy1lbmdsaXNoLGNvbnZlcnNhdGlvbmFsLWVuZ2xpc2gsZW5nbGlzaC1mb3Ita2lkcyxpZWx0cyx0b2VpYyIsInJlc3VtZSI6bnVsbCwiaXNBY3RpdmF0ZWQiOnRydWUsImlzTmF0aXZlIjpudWxsLCJjcmVhdGVkQXQiOiIyMDIxLTA4LTAyVDE0OjAzOjM2LjMyMFoiLCJ1cGRhdGVkQXQiOiIyMDIxLTA5LTA4VDE3OjQ3OjQ4LjkyOVoifSwicmVxdWlyZU5vdGUiOm51bGwsImxldmVsIjoiQURWQU5DRUQiLCJpc1Bob25lQWN0aXZhdGVkIjpudWxsLCJ0aW1lem9uZSI6N30sImlzVHV0b3IiOmZhbHNlLCJzdGFydFRpbWUiOjE2NDI2NDQwMDAwMDAsImVuZFNlc3Npb24iOjE2NDI2NDU1MDAwMDAsInRpbWVJblJvb20iOjE4MDAsImJvb2tpbmdJZCI6ImE5ZWIyMWRjLWQ1ZTAtNDllZC04NjYxLTQ5ODM0MjFkYjFkMSIsImlhdCI6MTY0MjU2NjgzMCwiZXhwIjoxNjQyNjU5ODk5LCJhdWQiOiJsaXZldHV0b3IiLCJpc3MiOiJsaXZldHV0b3IiLCJzdWIiOiJodHRwczovL21lZXQudHV0b3JpbmcubGV0c3R1ZHkuaW8ifQ.ChDXSzu5eSLyb6qtMBTIX7ReLqHDMKW-MsIbQSeoBDQ"
      ..webOptions = {
        "roomName":
            "f569c202-7bbf-4620-af77-ecc1419a6b28-4d54d3d7-d2a9-42e5-97a2-5ed38af5789a",
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText.text},
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
