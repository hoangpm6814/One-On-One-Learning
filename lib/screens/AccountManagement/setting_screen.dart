import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/customWidgets/change_theme_button_widget.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/rounded_setting_button.dart';
import 'package:lettutor/providers/theme_provider.dart';
import 'package:lettutor/screens/AccountManagement/profile_screen.dart';
import 'package:lettutor/screens/BecomeATutor/become_a_tutor_screen.dart';
import 'package:lettutor/screens/Course/course_list_screen.dart';
import 'package:lettutor/screens/ScheduleHistory/schedule_history_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final buttonTextColor = themeProvider.isDarkMode
        ? Theme.of(context).disabledColor
        : Theme.of(context).disabledColor;
    final buttonColor = themeProvider.isDarkMode
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColor;
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
            // RoundedSettingButton(
            //   icon: Icon(
            //     Icons.person,
            //     color: Colors.black,
            //   ),
            //   text: "View Feedbacks",
            //   press: () {},
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.person_add_alt,
                color: buttonTextColor,
              ),
              text: AppLocalizations.of(context).become_a_tutor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BecomeATutorScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.card_giftcard_rounded,
                color: buttonTextColor,
              ),
              text: AppLocalizations.of(context).course_for_you,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CourseListScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.history,
                color: buttonTextColor,
              ),
              text: AppLocalizations.of(context).booking_history,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ScheduleHistoryListScreen(),
                  ),
                );
              },
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // RoundedSettingButton(
            //   icon: Icon(
            //     Icons.history,
            //     color: Colors.black,
            //   ),
            //   text: "Session History",
            //   press: () {},
            // ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.settings,
                color: buttonTextColor,
              ),
              text: AppLocalizations.of(context).advanced_settings,
              press: () {},
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.web,
                color: buttonTextColor,
              ),
              text: AppLocalizations.of(context).our_website,
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            RoundedSettingButton(
              textColor: buttonTextColor,
              color: buttonColor,
              icon: Icon(
                Icons.facebook,
                color: buttonTextColor,
              ),
              text: "Facebook",
              press: () {},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  AppLocalizations.of(context).switch_mode,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                ChangeThemeButtonWidget(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: RoundedButtonSmallPadding(
                press: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WelcomeScreen(),
                    ),
                  );
                },
                text: AppLocalizations.of(context).log_out,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
