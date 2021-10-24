import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/light_rounded_button_time_pick.dart';
import 'package:lettutor/customWidgets/rounded_button_medium_padding.dart';

class PickTimeModelBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 10),
      height: 400,
      color: Colors.white,
      child: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
              title: Center(
                child: Text(
                  "Pick your time!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                LightRoundedButtonTimePick(
                  text: "06:00 - 06:25",
                ),
                LightRoundedButtonTimePick(
                  text: "06:30 - 06:55",
                ),
                LightRoundedButtonTimePick(
                  text: "Reserved",
                  textColor: Colors.grey,
                  color: kPrimaryButtonUnchosenColor,
                ),
                LightRoundedButtonTimePick(
                  text: "Reserved",
                  textColor: Colors.grey,
                  color: kPrimaryButtonUnchosenColor,
                ),
                LightRoundedButtonTimePick(
                  text: "17:30 - 17:55",
                ),
                LightRoundedButtonTimePick(
                  text: "18:30 - 18:25",
                ),
                LightRoundedButtonTimePick(
                  text: "21:00 - 21:25",
                ),
                LightRoundedButtonTimePick(
                  text: "21:30 - 21:55",
                ),
                LightRoundedButtonTimePick(
                  text: "22:00 - 22:25",
                ),
                LightRoundedButtonTimePick(
                  text: "22:30 - 22:55",
                ),
              ],
            ),
            // ElevatedButton(
            //   child: const Text('Close BottomSheet'),
            //   onPressed: () => Navigator.pop(context),
            // )
          ],
        ),
      ),
    );
  }
}
