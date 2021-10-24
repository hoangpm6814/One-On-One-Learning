import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/rounded_button_medium_padding.dart';

class PickDateModelBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 10),
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
                  "Pick your date!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "25/10/2021",
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "26/10/2021",
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "27/10/2021",
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "28/10/2021",
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "29/10/2021",
              ),
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonMediumPadding(
                text: "30/10/2021",
              ),
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
