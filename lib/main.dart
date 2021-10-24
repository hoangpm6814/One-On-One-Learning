import 'package:flutter/material.dart';
import 'package:lettutor/Pages/Chat/search_chat.dart';
import 'package:lettutor/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One On One',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SearchChatPage(),
    );
  }
}
