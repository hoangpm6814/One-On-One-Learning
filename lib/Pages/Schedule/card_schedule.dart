import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        // margin: EdgeInsets.symmetric(
        //   vertical: 8,
        //   horizontal: 8,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sun, October 24, 21",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text("1 lesson"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Row(
                      children: [
                        Icon(Icons.cancel, color: Colors.red, size: 20.0),
                        SizedBox(width: 5),
                        Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.red,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg"),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Darlyn Grace Sausa",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("Viet Nam"),
                      Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: kPrimaryColor,
                            size: 20.0,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Chat",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lesson time: " + "00:00 - 00:25",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Lesson requirement: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Edit requirement",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: kPrimaryColor, size: 15.0),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    child: Text(
                      'I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better.',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LightRoundedButtonMediumPadding(
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  text: "Enter lesson",
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
