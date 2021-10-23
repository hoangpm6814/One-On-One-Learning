import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

class SpecialityButtonClickable extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool isChosen;
  const SpecialityButtonClickable({
    Key key,
    this.text,
    this.press,
    // this.color = kPrimaryButtonUnchoosenColor,
    // this.textColor = Colors.grey,
    this.color = kPrimaryButtonChosenColor,
    this.textColor = kPrimaryColor,
    this.isChosen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 3),
      // width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: isChosen ? textColor : Colors.grey),
      ),
      onPressed: press,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            isChosen ? color : kPrimaryButtonUnchosenColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            // side: BorderSide(
            //   color: textColor,
            //   width: 1,
            //   style: BorderStyle.solid,
            // ),
            borderRadius: BorderRadius.circular(29),
            // borderRadius: BorderRadius.zero,
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: isChosen ? textColor : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
