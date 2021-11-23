import 'package:flutter/material.dart';
import 'package:lettutor/screens/BecomeATutor/Input/BasicInfo/country_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/BasicInfo/date_of_birth_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/BasicInfo/name_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/CV/education_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/CV/experience_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/CV/interest_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/CV/job_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/Language/language_input.dart';
import 'package:lettutor/screens/BecomeATutor/Input/Teaching/teaching_input.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/custom_border_noti.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/avatar_picker.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/choose_level_radio_button.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/part_divider.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';

class BecomeATutorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BecomeATutorScreenState();
  }
}

class BecomeATutorScreenState extends State<BecomeATutorScreen> {
  // String _name;
  // String _country;
  // String _dateOfBirth;
  // String _interest;
  // String _education;
  // String _experience;
  // String _job;
  // String _language;
  // String _introduction;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Widget _buildName() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Name'),
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Name is Required';
  //       }
  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _name = value;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Become A Tutor")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "Set up your tutor profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomedNotification(
                  text:
                      "Your tutor profile is your chance to reach students on app. You can edit it later on your profile page.\n\nNew students can browse tutor profiles to find a tutor that matches their academic goals and personality. When a student returns they can search from the profile of tutors who are willing to give them a great experience.",
                ),
                PartDivider(text: "Basic Information"),
                AvatarPicker(),
                // _buildName(),
                NameInput(),
                CountryInput(),
                DateOfBirthInput(),
                SizedBox(height: 30),
                PartDivider(text: "CV"),
                CustomedNotification(
                  text:
                      "To protect your privacy, please do not share any personal information such as email, phone number, skype,... in your profile.",
                ),
                InterestInput(),
                EducationInput(),
                ExperienceInput(),
                JobInput(),
                SizedBox(height: 30),
                PartDivider(text: "Language"),
                LanguageInput(),
                SizedBox(height: 30),
                PartDivider(text: "Teaching"),
                CustomedNotification(
                  text:
                      "This is the first thing students see when seeking for tutors.",
                ),
                TeachingInput(),
                LevelRadio(),
                PartDivider(text: "Introduction Video"),
                CustomedNotification(
                  text:
                      "Some useful tips:\n1) Look straight at the camera and smile naturally.\n2) Find a quite place to make a video.\n3) Dress politely.\n4) Video should be between 1 and 3 minutes.\n5) Brand yourself and have fun.",
                ),
                LightRoundedButtonMediumPadding(
                  color: Colors.white,
                  textColor: kPrimaryColor,
                  text: "Choose video",
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text(
                    'Press to become a tutor!',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    // print(_name);
                    // print(_dateOfBirth);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
