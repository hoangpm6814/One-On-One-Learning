import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/customWidgets/rating.dart';
import 'package:lettutor/models/review.dart';

class CardRating extends StatelessWidget {
  const CardRating({
    Key key,
    @required this.review,
  }) : super(key: key);

  final Review review;

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
                    backgroundImage: NetworkImage(review.avatar),
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
                    review.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm')
                        .format(DateTime.parse(review.createdAt)),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    // width: 150,
                    child: Text(
                      review.content,
                    ),
                  ),
                ],
              )),
              SizedBox(
                width: 10,
              ),
              Column(
                children: <Widget>[
                  RatingStar(
                    rating: review.rating.toDouble(),
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
