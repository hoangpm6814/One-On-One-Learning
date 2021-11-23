import 'package:flutter/material.dart';
import 'package:lettutor/screens/Chat/local_widgets/chat_cell.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/models/tutor.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

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
                    (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                0.1,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            // color: k2PrimaryColor,
            child: Scaffold(
              body: Container(
                width: double.infinity,
                child: RoundedInputField(
                  icon: Icons.search,
                  hintText: "Search message",
                  onChanged: (value) {},
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
                      return ChatCell(tutor: tutors[index]);
                    },
                    itemCount: tutors.length,
                  ),
                ),
        ],
      ),
    );
  }
}
