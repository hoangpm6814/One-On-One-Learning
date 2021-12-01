import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/rounded_setting_button.dart';
import 'package:lettutor/screens/AccountManagement/profile_screen.dart';
import 'package:lettutor/screens/Login/login_screen.dart';
import 'package:lettutor/screens/ScheduleHistory/schedule_history_list_screen.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(),
                  ),
                );
              },
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        // maxRadius: 70,
                        backgroundImage: NetworkImage(
                            "https://api.app.lettutor.com/avatar/86248137-6f7d-4cf5-ad2e-34da42722b28avatar1628058042246.jpg"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mai Khanh",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "maikhanh@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        // Text(
                        //   "Viet Nam",
                        //   style: TextStyle(
                        //       // color: Colors.grey,
                        //       ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              text: "View Feedbacks",
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.list,
                color: Colors.black,
              ),
              text: "Booking History",
              press: () {
                // print("push");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ScheduleHistoryListScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.history,
                color: Colors.black,
              ),
              text: "Session History",
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              text: "Advanced Settings",
              press: () {},
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.web,
                color: Colors.black,
              ),
              text: "Our Website",
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              icon: Icon(
                Icons.facebook,
                color: Colors.black,
              ),
              text: "Facebook",
              press: () {},
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonSmallPadding(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                text: "Log out",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
