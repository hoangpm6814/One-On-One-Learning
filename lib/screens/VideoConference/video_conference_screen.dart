import 'package:flutter/material.dart';

class VideoConferenceScreen extends StatefulWidget {
  const VideoConferenceScreen({Key key}) : super(key: key);

  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("View Schedule")),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 40),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tutoring Meeting Room ',
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
                        "Lesson will be started after",
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
        ],
      ),
    );
  }
}
