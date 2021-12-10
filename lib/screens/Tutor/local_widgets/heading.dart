import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:lettutor/screens/VideoConference/video_conference_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).lesson_time_spent("11", "45"),
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
}
