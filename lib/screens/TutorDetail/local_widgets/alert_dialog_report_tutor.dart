import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';

class AlertDialogReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Report this tutor'),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                "Share us what's wrong with you...",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Content",
                ),
                onSaved: (String value) {
                  // _introduction = value;
                },
                keyboardType: TextInputType.multiline,
                // maxLength: 200,
                maxLines: 3,
              ),
              SizedBox(height: 10),
              SpecialityButtonClickable(
                text: "This tutor is annoying me.",
                isChosen: true,
              ),
              SpecialityButtonClickable(
                text: "This profile is fake or someone else's",
                isChosen: true,
              ),
              SpecialityButtonClickable(
                text: "Inappropriate profile photo.",
                isChosen: true,
              ),
              SizedBox(height: 30),
              LightRoundedButtonSmallPadding(
                text: "Report tutor",
                press: () {
                  // send data
                  Navigator.pop(context);
                },
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //     icon: Icon(Icons.email),
              //   ),
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     labelText: 'Message',
              //     icon: Icon(Icons.message),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // actions: [
      //   LightRoundedButtonSmallPadding(
      //     text: "Report tutor",
      //   ),
      // ],
    );
  }
}
