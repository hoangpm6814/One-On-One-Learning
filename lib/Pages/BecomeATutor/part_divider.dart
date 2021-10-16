import 'package:flutter/material.dart';

class PartDivider extends StatelessWidget {
  final String text;
  const PartDivider({
    Key key,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: Divider(
                color: Colors.red,
                height: 50,
              )),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.red),
        ),
        Expanded(
          flex: 2,
          child: new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Divider(
                color: Colors.red,
                height: 50,
              )),
        ),
      ],
    );
  }
}
