import 'package:flutter/material.dart';
import 'package:lettutor/screens/Login/login_screen.dart';
import 'package:lettutor/screens/Signup/signup_screen.dart';
import 'package:lettutor/customWidgets/rounded_button.dart';
import 'package:lettutor/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ONE ON ONE LEARNING APP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Image.asset(
                  "assets/images/welcome_img.png",
                  height: size.height * 0.45,
                ),
                SizedBox(height: size.height * 0.05),
                RoundedButton(
                  text: "LOG IN",
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
                RoundedButton(
                  text: "SIGN UP",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
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
