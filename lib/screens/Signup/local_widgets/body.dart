import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/screens/Login/login_screen.dart';
import 'package:lettutor/screens/Signup/local_widgets/or_divider.dart';
import 'package:lettutor/screens/Signup/local_widgets/social_icon.dart';
import 'package:lettutor/customWidgets/already_have_account_check.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
// import 'package:lettutor/customWidgets/rounded_input_field.dart';
// import 'package:lettutor/customWidgets/rounded_password_field.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String retypePassword = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 30) {
      return "Password should not be greater than 30 characters";
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain a lowercase letter";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain an uppercase letter";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain a special character";
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppLocalizations.of(context).sign_up_upper,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Image.asset(
                  "assets/images/signup_img.png",
                  height: size.height * 0.4,
                ),
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
                            labelText: AppLocalizations.of(context).your_email,
                            hintText: 'abc@gmail.com',
                            prefixIcon: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                            ),
                          ),
                          cursorColor: kPrimaryColor,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "* Required"),
                              EmailValidator(errorText: "Enter a valid email"),
                            ],
                          ),
                          controller: emailController,
                          onSaved: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 15, bottom: 0),
                        child: TextFormField(
                          obscureText: true,
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
                          validator: validatePassword,
                          onSaved: (value) {
                            password = value;
                          },
                          controller: passWordController,
                          //validatePassword,        //Function to check validation
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 15, bottom: 0),
                        child: TextFormField(
                          obscureText: true,
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
                            labelText:
                                AppLocalizations.of(context).retype_password,
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
                          validator: (value) {
                            if (value.isEmpty) return '* Required';
                            if (value != passWordController.text)
                              return 'Two passwords must be identical';
                            return null;
                          },
                          onSaved: (value) {
                            retypePassword = value;
                          },
                          controller: confirmPasswordController,
                          //validatePassword,        //Function to check validation
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                        text: AppLocalizations.of(context).sign_up_upper,
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
                  login: false,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook_icon.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google_icon.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
