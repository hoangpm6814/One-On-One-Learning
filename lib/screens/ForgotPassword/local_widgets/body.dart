import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
import 'package:lettutor/providers/auth_provider.dart';
import 'package:lettutor/screens/Login/login_screen.dart';
import 'package:provider/provider.dart';
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
  String email = "";

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
      String message = await Provider.of<AuthProvider>(context, listen: false)
          .forgotPassword(
        email,
      );
      _showDialogSuccess(message);
    } catch (error) {
      const errorMessage = 'Could not send your email. Please check.';
      _showDialog(errorMessage);
    }

    // setState(() {
    //   _isLoading = false;
    // });
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _showDialogSuccess(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(message),
        content: Text("Please check your email to reset your password."),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Okay'),
            onPressed: () {
              // Navigator.of(ctx).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              );
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
      padding: EdgeInsets.all(40),
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
                  AppLocalizations.of(context).forgot_password_upper,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/forgotpassword.svg",
                  height: size.height * 0.32,
                ),
                SizedBox(height: size.height * 0.03),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Enter your email address and we'll send you"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("a link to reset your password"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
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
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                        text: AppLocalizations.of(context).send,
                        press: () {
                          _submit();
                        },
                      ),
                    ],
                  ),
                ),
                // RoundedButton(
                //   text: "Send",
                //   press: () {},
                // ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
