import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

class CardRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  // Image.network('https://picsum.photos/250?image=9'),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://api.app.lettutor.com/avatar/86248137-6f7d-4cf5-ad2e-34da42722b28avatar1628058042246.jpg"),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mai Khanh",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  Text(
                    "10:02:36, 16/10/2021",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    // width: 150,
                    child: Text(
                      "She is indeed a very good teacher, gonna be back!",
                    ),
                  ),
                ],
              )),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Icon(Icons.star, color: kPrimaryRatingStar, size: 15.0),
                      Icon(Icons.star, color: kPrimaryRatingStar, size: 15.0),
                      Icon(Icons.star, color: kPrimaryRatingStar, size: 15.0),
                      Icon(Icons.star, color: kPrimaryRatingStar, size: 15.0),
                      Icon(Icons.star, color: kPrimaryRatingStar, size: 15.0),
                    ],
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
