import 'package:flutter/material.dart';

class LevelRadio extends StatefulWidget {
  // const LevelRadio({ Key key }) : super(key: key);

  @override
  _LevelRadioState createState() => _LevelRadioState();
}

class _LevelRadioState extends State<LevelRadio> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'beginner';
  // Group Value for Radio Button. // default
  int id = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "I prefer working with student's level: " + '$radioButtonItem',
            // style: TextStyle(fontSize: 21),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'beginner';
                  id = 1;
                });
              },
            ),
            Text(
              'Beginner',
              // style: new TextStyle(fontSize: 17.0),
            ),
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'intermediate';
                  id = 2;
                });
              },
            ),
            Text(
              'Intermediate',
              // style: new TextStyle(
              //   fontSize: 17.0,
              // ),
            ),
            Radio(
              value: 3,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'advanced';
                  id = 3;
                });
              },
            ),
            Text(
              'Advanced',
              // style: new TextStyle(fontSize: 17.0),
            ),
          ],
        ),
      ],
    );
  }
}
