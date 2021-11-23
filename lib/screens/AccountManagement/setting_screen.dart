import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/rounded_setting_button.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        // maxRadius: 70,
                        backgroundImage: NetworkImage(
                            "https://api.app.lettutor.com/avatar/da323fee-20c6-4eb1-b198-3187e176b177avatar1630510677527.jpg"),
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
                          "Minh Pham",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "useremail@gmail.com",
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
              SizedBox(
                height: 30,
              ),
              RoundedSettingButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                text: "View Feedbacks",
              ),
              SizedBox(
                height: 10,
              ),
              RoundedSettingButton(
                icon: Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                text: "Booking history",
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
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: RoundedButtonSmallPadding(
                  text: "Log out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
