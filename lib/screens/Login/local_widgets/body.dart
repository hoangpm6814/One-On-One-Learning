import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/screens/Signup/signup_screen.dart';
import 'package:lettutor/customWidgets/already_have_account_check.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
// import 'package:lettutor/customWidgets/rounded_input_field.dart';
// import 'package:lettutor/customWidgets/rounded_password_field.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }

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
                // RoundedInputField(
                //   hintText: AppLocalizations.of(context).your_email,
                //   onChanged: (value) {},
                // ),
                // RoundedPasswordField(
                //   onChanged: (value) {},
                // ),
                Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                // borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                ),
                              ),
                              labelStyle: new TextStyle(color: kPrimaryColor),
                              labelText:
                                  AppLocalizations.of(context).your_email,
                              hintText: 'abc@gmail.com',
                              prefixIcon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                            ),
                            cursorColor: kPrimaryColor,
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              EmailValidator(errorText: "Enter a valid email"),
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 20, bottom: 0),
                        child: TextFormField(
                          obscureText: true,
                          // decoration: InputDecoration(
                          //     border: OutlineInputBorder(),
                          //     labelText: AppLocalizations.of(context).password,
                          //     hintText: 'Enter your secure password'),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              // borderSide: BorderSide(color: kPrimaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                              ),
                            ),
                            labelStyle: new TextStyle(color: kPrimaryColor),
                            labelText: AppLocalizations.of(context).password,
                            // hintText: 'Enter your secure password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ),
                          ),
                          cursorColor: kPrimaryColor,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText:
                                    "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                    "Password should not be greater than 15 characters"),
                          ]),
                          //validatePassword,        //Function to check validation
                        ),
                      ),
                      const SizedBox(
                        height: 15,
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
                    ],
                  ),
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
