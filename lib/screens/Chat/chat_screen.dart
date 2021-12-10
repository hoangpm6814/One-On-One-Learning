import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/search.dart';
import 'package:lettutor/screens/Chat/local_widgets/chat_cell.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Tutor> tutors = [
    Tutor(
      id: "1",
      name: "Ashley Young",
      rating: 4.5,
      avatar:
          "https://api.app.lettutor.com/avatar/c21e521c-829e-4c99-958d-726450b5fbd8avatar1637483330267.jpg",
      description:
          "While I've always longed to be an ESL teacher, the delight I had from assisting students' growth and development definitely encouraged my desire. I feel that my enthusiasm, good approach, and hands-on experience working with youngsters will make me a fantastic educator. I'm looking forward to a career that allows me to mold young minds and make a difference in the lives of the children in my community.",
      nation: "Canada",
      languages: ["English", "French", "Vietnamese"],
      education: "PhD. from University of Toronto",
      experience:
          "I have experience in online teaching, I teach student's in different levels from kids to adult.",
      interest:
          "I am music enthusiast, my hobbies are playing guitar, singing and dancing.",
      profession:
          "I'm an Assistant Instructor in ACLC College. I teach senior high school student and I handle English.",
      specialties: ["Conversational", "IELTS"],
    ),
    Tutor(
      id: "2",
      name: "Kathy Huynh",
      rating: 5,
      avatar:
          "https://api.app.lettutor.com/avatar/7a1067cc-4a79-494d-820c-34e63cf60748avatar1636901693895.jpg",
      description:
          "Hello thank you for visiting my profile I am Silkyza, 26 years old from VietNam. I am a Licensed Professional Teacher with TEFL certificate. I am teaching English, Tagalog and Cebuano. I am can teach students in different levels from A0- B1. I can also handle students in all ages from kids to adults. I already have experience in online teaching.",
      nation: "Viet Nam",
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
      rating: 4,
      avatar:
          "https://api.app.lettutor.com/avatar/cdb22890-fb57-4ec7-b4b7-829716c85a17avatar1637320790420.png",
      description:
          "A teacher for almost a decade with lengthy teaching exposure with Vietnamese students, adult professionals, non -professionals, and executives. Teaching is a skill delivered with own style and creativity focused on YOU. YES, our lessons will be based on what really matters to you, what you want to learn in a short possible time.",
      nation: "Philippines",
      languages: ["English", "Vietnamese"],
      education: "PhD. from University of Toronto",
      experience:
          "I have experience in online teaching, I teach student's in different levels from kids to adult.",
      interest:
          "I am music enthusiast, my hobbies are playing guitar, singing and dancing.",
      profession:
          "I'm an Assistant Instructor in ACLC College. I teach senior high school student and I handle English.",
      specialties: ["Conversational", "STARTERS"],
    ),
    Tutor(
      id: "4",
      name: "April Corpuz",
      rating: 4.5,
      avatar:
          "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg",
      description:
          "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners.",
      nation: "Philippines",
      languages: ["English", "French", "Vietnamese"],
      education: "Bachelor from University of Technology",
      experience: "5 years of English teaching experience",
      interest: "Finance, gardening, travelling",
      profession:
          "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
      specialties: ["Conversational", "IELTS", "STARTERS", "MOVERS"],
    ),
  ];

  String query = '';

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: AppLocalizations.of(context).search_message,
        onChanged: (value) {},
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Container(
          //   height: (MediaQuery.of(context).size.height -
          //           (MediaQuery.of(context).padding.top + kToolbarHeight)) *
          //       0.1,
          //   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          //   // color: k2PrimaryColor,
          //   child: Scaffold(
          //     body: Container(
          //       width: double.infinity,
          //       child: RoundedInputField(
          //         icon: Icons.search,
          //         hintText: AppLocalizations.of(context).search_message,
          //         onChanged: (value) {},
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: buildSearch(),
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
