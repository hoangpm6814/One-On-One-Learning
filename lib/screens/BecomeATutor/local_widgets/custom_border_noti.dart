import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomedNotification extends StatelessWidget {
  final String text;
  const CustomedNotification({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      // width: 100,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        color: themeProvider.isDarkMode
            ? Colors.lightBlue[300]
            : Colors.lightBlue[50],
      ),

      child: Text(
        text,
      ),
    );
  }
}
