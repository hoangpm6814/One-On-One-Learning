import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlertDialogReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(AppLocalizations.of(context).report_this_tutor),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.of(context).share_us_what_wrong,
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
                  hintText: AppLocalizations.of(context).content,
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
                text: AppLocalizations.of(context).chip_this_tutor_is_annoying,
                isChosen: true,
              ),
              SpecialityButtonClickable(
                text: AppLocalizations.of(context).chip_this_profile_is_fake,
                isChosen: true,
              ),
              SpecialityButtonClickable(
                text: AppLocalizations.of(context).chip_inappropriate_profile,
                isChosen: true,
              ),
              SizedBox(height: 30),
              LightRoundedButtonSmallPadding(
                text: AppLocalizations.of(context).report_tutor,
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
