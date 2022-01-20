import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
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

  // final serverText = TextEditingController();
  // final roomText = TextEditingController(text: "plugintestroom");
  // final subjectText = TextEditingController(
  //     text:
  //         "Tutoring meeting room:"); // show in the top of the meeting before timer
  // final nameText = TextEditingController(text: "Plugin Test User");
  // final emailText = TextEditingController(text: "fake@email.com");
  // final iosAppBarRGBAColor =
  //     TextEditingController(text: "#0080FF80"); //transparent blue
  bool isAudioOnly = true;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String roomId;
  String roomToken;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((element) {
      print(element.group(0));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DateTime now = DateTime.now();
    DateTime startTime = widget.schedule.startTimeDateTime;
    // DateTime startTime = DateTime.now().subtract(Duration(minutes: 6));
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

    // print("token: " + widget.schedule.meetingToken);
    // printLongString(widget.schedule.meetingToken);

    roomToken = widget.schedule.meetingToken;
    String subToken = roomToken.substring(37, 37 + 392);
    // print("subToken: " + subToken);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String decoded = stringToBase64.decode(subToken);
    // print("decoded: " + decoded);

    String from = '"room":"';
    final startIndex = decoded.indexOf(from);
    // var t = startIndex + from.length;
    roomId = decoded.substring(
        startIndex + from.length, startIndex + from.length + 73);
    print("roomId: " + roomId);

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
    // Size size = MediaQuery.of(context).size;
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
          // SizedBox(height: size.height * 0.01),
          !isCountDown
              ? Container(
                  height: 50,
                  // margin: EdgeInsets.symmetric(vertical: 40),
                  // padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).time_in_class,
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
              : Container(),
          isCountDown
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       "assets/icons/app_logo_oneonone.png",
                    //       height: 90,
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              : Container(),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/app_logo_oneonone.png",
                      height: 90,
                    ),
                  ],
                ),
                RoundedButtonSmallPadding(
                  text: AppLocalizations.of(context).enroll_class,
                  press: () {
                    _joinMeeting(context);
                  },
                ),
              ],
            ),
          ),
          // SizedBox(height: size.height * 0.03),
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

  _joinMeeting(BuildContext context) async {
    // String serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

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
    var options = JitsiMeetingOptions(room: roomId)
      ..serverURL = "https://meet.lettutor.com"
      ..subject = AppLocalizations.of(context).tutoring_meeting_room
      // ..userDisplayName = nameText.text
      // ..userEmail = "student@lettutor.com"
      // ..iosAppBarRGBAColor = iosAppBarRGBAColor.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      // ..featureFlags = featureFlag as Map<FeatureFlagEnum, bool>
      ..token = roomToken
      ..webOptions = {
        "roomName": roomId,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        // "userInfo": {"displayName": nameText.text},
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
