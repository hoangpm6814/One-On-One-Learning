import 'package:flutter/material.dart';
import 'package:lettutor/screens/Chat/local_widgets/chat_cell.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat';

  final List<Tutor> tutors = [
    Tutor(
      id: "1",
      name: "Ashley Young",
      rating: 5,
      avatar:
          "https://api.app.lettutor.com/avatar/c21e521c-829e-4c99-958d-726450b5fbd8avatar1637483330267.jpg",
      description:
          "While I've always longed to be an ESL teacher, the delight I had from assisting students' growth and development definitely encouraged my desire. I feel that my enthusiasm, good approach, and hands-on experience working with youngsters will make me a fantastic educator. I'm looking forward to a career that allows me to mold young minds and make a difference in the lives of the children in my community.",
      languages: ["English", "Vietnamese"],
      education: "Bachelor from University of Technology",
      experience: "5 years of English teaching experience",
      interest: "Finance, gardening, travelling",
      profession:
          "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
      specialties: ["Conversational"],
    ),
    Tutor(
      id: "2",
      name: "Kathy Huynh",
      rating: 5,
      avatar:
          "https://api.app.lettutor.com/avatar/7a1067cc-4a79-494d-820c-34e63cf60748avatar1636901693895.jpg",
      description:
          "Hello thank you for visiting my profile I am Silkyza, 26 years old from Philippines. I am a Licensed Professional Teacher with TEFL certificate. I am teaching English, Tagalog and Cebuano. I am can teach students in different levels from A0- B1. I can also handle students in all ages from kids to adults. I already have experience in online teaching.",
      languages: ["English", "Vietnamese"],
      education: "Bachelor from University of Technology",
      experience: "5 years of English teaching experience",
      interest: "Finance, gardening, travelling",
      profession:
          "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
      specialties: ["Conversational"],
    ),
    Tutor(
      id: "3",
      name: "Maria Silkyza Galvez",
      rating: 5,
      avatar:
          "https://api.app.lettutor.com/avatar/cdb22890-fb57-4ec7-b4b7-829716c85a17avatar1637320790420.png",
      description: "I am a nice english teacher who helps you import Endlish",
      languages: ["English", "Vietnamese"],
      education: "Bachelor from University of Technology",
      experience: "5 years of English teaching experience",
      interest: "Finance, gardening, travelling",
      profession:
          "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
      specialties: ["Conversational"],
    ),
    Tutor(
      id: "4",
      name: "April Corpuz",
      rating: 4,
      avatar:
          "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg",
      description:
          "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world.",
      languages: ["English", "Vietnamese"],
      education: "Bachelor from University of Technology",
      experience: "5 years of English teaching experience",
      interest: "Finance, gardening, travelling",
      profession:
          "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
      specialties: ["Conversational"],
    ),
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
                  hintText: AppLocalizations.of(context).search_message,
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
