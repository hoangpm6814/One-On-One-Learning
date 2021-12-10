import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/screens/Chat/chat_detail_screen.dart';

class ChatCell extends StatelessWidget {
  const ChatCell({
    Key key,
    @required this.tutor,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          // vertical: 8,
          horizontal: 8,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(tutor.avatar),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tutor.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "You: Good morning",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              "13/10/21 07:29 AM",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  // Column(
                  //   children: <Widget>[
                  //     Text(
                  //       "13/10/21 07:29 AM",
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //         fontSize: 10,
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
