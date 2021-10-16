import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

class LightRoundedButtonMediumPadding extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const LightRoundedButtonMediumPadding({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              color: textColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10),
            // borderRadius: BorderRadius.zero,
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 15,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
