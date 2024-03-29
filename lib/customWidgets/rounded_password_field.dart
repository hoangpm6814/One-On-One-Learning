import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/text_field_container.dart';
import 'package:lettutor/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black54);
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          hintStyle: textStyle,
        ),
        style: textStyle,
      ),
    );
  }
}
