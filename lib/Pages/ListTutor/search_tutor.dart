import 'package:flutter/material.dart';
import 'package:lettutor/Pages/ListTutor/card_tutor.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:lettutor/models/tutor.dart';

class SearchTutorPage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Tutor',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                  0.1,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              // color: k2PrimaryColor,
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  child: RoundedInputField(
                    icon: Icons.search,
                    hintText: "Type to find tutor",
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                  0.07,
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              // color: k2PrimaryColor,
              child: Scaffold(
                body: Container(
                  // width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SpecialityButtonClickable(
                        text: "All",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "English for kids",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "English for Business",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "Conversational",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "STARTERS",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "MOVERS",
                      ),
                      SizedBox(width: 5),
                      SpecialityButtonClickable(
                        text: "FLYERS",
                      ),
                      SizedBox(width: 5),
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
                        0.8,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return CardTutor(tutor: tutors[index]);
                      },
                      itemCount: tutors.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
