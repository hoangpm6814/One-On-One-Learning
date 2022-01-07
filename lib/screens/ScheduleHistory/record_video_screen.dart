import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/video/network_video_player.dart';

class RecordVideoScreen extends StatefulWidget {
  const RecordVideoScreen({
    Key key,
    @required this.url,
  }) : super(key: key);

  final String url;
  @override
  State<StatefulWidget> createState() {
    return RecordVideoScreenState();
  }
}

class RecordVideoScreenState extends State<RecordVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).record_video),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NetworkPlayerWidget(
              url: widget.url,
            ),
          ],
        ),
      ),
    );
  }
}
