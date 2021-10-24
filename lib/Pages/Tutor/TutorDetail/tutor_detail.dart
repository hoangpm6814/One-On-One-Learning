import 'package:flutter/material.dart';
import 'package:lettutor/Pages/Tutor/TutorDetail/alert_dialog_report_tutor.dart';
import 'package:lettutor/Pages/Tutor/TutorDetail/card_rating.dart';
import 'package:lettutor/Pages/Tutor/TutorDetail/pick_date_model_bottom.dart';
import 'package:lettutor/Pages/Tutor/TutorDetail/pick_time_model_bottom.dart';
import 'package:lettutor/Pages/Tutor/TutorDetail/tutor_description.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_medium_padding.dart';

class TutorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tutor Detail")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        // maxRadius: 70,
                        backgroundImage: NetworkImage(
                            "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg"),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hannah Nguyen",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Teacher",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Viet Nam",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: kPrimaryRatingStar, size: 20.0),
                          Icon(Icons.star,
                              color: kPrimaryRatingStar, size: 20.0),
                          Icon(Icons.star,
                              color: kPrimaryRatingStar, size: 20.0),
                          Icon(Icons.star,
                              color: kPrimaryRatingStar, size: 20.0),
                          Icon(Icons.star_half,
                              color: kPrimaryRatingStar, size: 20.0),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        color: Theme.of(context).errorColor,
                        onPressed: () => {},
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: double.infinity,
                child: RoundedButtonMediumPadding(
                  text: "Booking",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.message,
                          color: kPrimaryColor,
                        ),
                        Text(
                          "Message",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return PickDateModelBottom();
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: kPrimaryColor,
                        ),
                        Text(
                          "Report",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogReport();
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: kPrimaryColor,
                        ),
                        Text(
                          "Reviews",
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return PickTimeModelBottom();
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              TutorDescription(),
              SizedBox(height: 10),
              Text(
                "Rating and Comment" + "(3)",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 5),
              CardRating(),
              CardRating(),
              CardRating(),
            ],
          ),
        ),
      ),
    );
  }
}
