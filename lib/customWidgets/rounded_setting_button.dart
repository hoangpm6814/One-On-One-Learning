import 'package:flutter/material.dart';

class RoundedSettingButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final Icon icon;
  const RoundedSettingButton({
    Key key,
    this.text,
    this.press,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
            // borderRadius: BorderRadius.zero,
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        // textStyle: MaterialStateProperty.all(
        //   TextStyle(
        //     color: Colors.black,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 15,
          ),
        ],
      ),
      onPressed: press,
    );
  }
}
