import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/http_exception.dart';
import 'package:lettutor/providers/auth_provider.dart';
import 'package:lettutor/providers/facebook_signin_provider.dart';
import 'package:lettutor/providers/google_signin_provider.dart';
import 'package:lettutor/screens/ForgotPassword/forgot_password_screen.dart';
import 'package:lettutor/screens/Login/local_widgets/or_divider.dart';
import 'package:lettutor/screens/Login/local_widgets/social_icon.dart';
import 'package:lettutor/screens/Signup/signup_screen.dart';
import 'package:lettutor/customWidgets/already_have_account_check.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
// import 'package:lettutor/customWidgets/rounded_input_field.dart';
// import 'package:lettutor/customWidgets/rounded_password_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

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

  Future<void> _submit() async {
    if (!formkey.currentState.validate()) {
      // Invalid!
      return;
    }
    formkey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });
    try {
      // Log user in
      await Provider.of<AuthProvider>(context, listen: false).login(
        email,
        password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TabsScreen(),
        ),
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed. Incorrect email or password.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Incorrect email or password.';
      _showErrorDialog(errorMessage);
    }

    // setState(() {
    //   _isLoading = false;
    // });
  }

  Future<void> _submitGoogle(String access_token) async {
    try {
      // Log user in
      await Provider.of<AuthProvider>(context, listen: false)
          .loginWithGoogle(access_token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TabsScreen(),
        ),
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed. Email not valid.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Email not valid.';
      _showErrorDialog(errorMessage);
    }
  }

  Future<void> _submitFacebook(String access_token) async {
    try {
      // Log user in
      await Provider.of<AuthProvider>(context, listen: false)
          .loginWithFacebook(access_token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => TabsScreen(),
        ),
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed. Email not valid.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Email not valid.';
      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Cancel'),
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
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
                SizedBox(height: size.height * 0.02),
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
                          onSaved: (value) {
                            setState(() {
                              email = value;
                            });
                          },
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
                        ),
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
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "* Required"),
                              MinLengthValidator(6,
                                  errorText:
                                      "Password should be atleast 6 characters"),
                              MaxLengthValidator(15,
                                  errorText:
                                      "Password should not be greater than 15 characters"),
                            ],
                          ),
                          //validatePassword,        //Function to check validation
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                        text: AppLocalizations.of(context).log_in_upper,
                        press: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => TabsScreen(),
                          //   ),
                          // );
                          _submit();
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).forgot_password,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
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
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/facebook_icon.svg",
                      press: () async {
                        String access_token =
                            await Provider.of<FacebookSignInProvider>(context,
                                    listen: false)
                                .signInWithFacebook();
                        await _submitFacebook(access_token);
                      },
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google_icon.svg",
                      press: () async {
                        String access_token =
                            await Provider.of<GoogleSignInProvider>(context,
                                    listen: false)
                                .googleLogin();
                        await _submitGoogle(access_token);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
