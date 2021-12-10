import 'package:flutter/material.dart';
import 'package:lettutor/screens/Signup/signup_screen.dart';
import 'package:lettutor/customWidgets/already_have_account_check.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/customWidgets/rounded_password_field.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).log_in_upper,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/login_img.png",
                  height: size.height * 0.4,
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  hintText: AppLocalizations.of(context).your_email,
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: AppLocalizations.of(context).log_in_upper,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TabsScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
