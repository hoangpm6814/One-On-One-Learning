import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/screens/VideoConference/video_conference_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Heading extends StatefulWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
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
      Provider.of<UserProvider>(context).fetchUserTotalTime().then((_) {
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
    var time = Provider.of<UserProvider>(context).totalTime;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)
                    .lesson_time_spent(getHour(time), getMinute(time)),
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Text(
                AppLocalizations.of(context).upcomming_lession,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              Text(
                "Wed, 24 Oct 6:30 - 6:55",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RoundedButtonSmallPadding(
                color: Theme.of(context).scaffoldBackgroundColor,
                textColor: kPrimaryColor,
                text: AppLocalizations.of(context).go_to_class,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoConferenceScreen(),
                    ),
                  );
                },
              )
            ],
          );
  }

  String getHour(int totalMinute) {
    int hour = totalMinute ~/ 60;
    return hour.toString();
  }

  String getMinute(int totalMinute) {
    int hourSpent = totalMinute ~/ 60;
    int minuteSpent = totalMinute - hourSpent * 60;
    return minuteSpent.toString();
  }
}
