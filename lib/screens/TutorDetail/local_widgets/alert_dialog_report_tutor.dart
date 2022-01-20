import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:provider/provider.dart';

class AlertDialogReport extends StatelessWidget {
  AlertDialogReport({
    Key key,
    @required this.tutorId,
  }) : super(key: key);

  final String tutorId;

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    String content = '';

    return AlertDialog(
      scrollable: true,
      title: Text(AppLocalizations.of(context).report_this_tutor),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Form(
          key: _form,
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
                  content = value;
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Content of report is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                // maxLength: 200,
                maxLines: 3,
              ),
              // SizedBox(height: 10),
              // SpecialityButtonClickable(
              //   text: AppLocalizations.of(context).chip_this_tutor_is_annoying,
              //   isChosen: true,
              // ),
              // SpecialityButtonClickable(
              //   text: AppLocalizations.of(context).chip_this_profile_is_fake,
              //   isChosen: true,
              // ),
              // SpecialityButtonClickable(
              //   text: AppLocalizations.of(context).chip_inappropriate_profile,
              //   isChosen: true,
              // ),
              // SizedBox(height: 30),
              LightRoundedButtonSmallPadding(
                text: AppLocalizations.of(context).report_tutor,
                press: () async {
                  // send data
                  _form.currentState.save();

                  String message =
                      await Provider.of<TutorProvider>(context, listen: false)
                          .reportTutor(tutorId, content);

                  var snackBar = SnackBar(
                    content: Text(message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

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
