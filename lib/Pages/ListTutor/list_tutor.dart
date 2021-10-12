import 'package:flutter/material.dart';
import 'package:lettutor/Pages/ListTutor/card_tutor.dart';
import 'package:lettutor/models/tutor.dart';

class ListTutorPage extends StatelessWidget {
  final List<Tutor> tutors = [
    Tutor(
        id: "1",
        name: "Ashley Young",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "2",
        name: "Michael Owen",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "3",
        name: "Stephen Curry",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "4",
        name: "Taylor Swift",
        rating: 4,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "1",
        name: "Ashley Young",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "2",
        name: "Michael Owen",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "3",
        name: "Stephen Curry",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "4",
        name: "Taylor Swift",
        rating: 4,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "1",
        name: "Ashley Young",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "2",
        name: "Michael Owen",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "3",
        name: "Stephen Curry",
        rating: 5,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
    Tutor(
        id: "4",
        name: "Taylor Swift",
        rating: 4,
        avatar:
            "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
        discription:
            "I am a nice english teacher who helps you import Endlish"),
  ];

  // ListTutor(this.tutors);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.3,
            child: Card(
              elevation: 6,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text("This is the part of noti"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text("This is the part of noti"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          tutors.isEmpty
              ? Container()
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CardTutor(tutor: tutors[index]);
                    },
                    itemCount: tutors.length,
                  ),
                ),
        ],
      ),
    );
  }
}
