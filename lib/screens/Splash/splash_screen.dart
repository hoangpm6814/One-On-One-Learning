import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/icons/app_logo_oneonone.png",
          height: size.height * 0.4,
        ),
      ),
    );
  }
}
