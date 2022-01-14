import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoConferenceScreen extends StatefulWidget {
  static const routeName = '/video-conference';

  const VideoConferenceScreen({Key key}) : super(key: key);

  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> {
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
          Container(
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
                Text(
                  "00:09",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                      Text(
                        "15 : 44 : 01",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
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
