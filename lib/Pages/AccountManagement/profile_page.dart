import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://api.app.lettutor.com/avatar/da323fee-20c6-4eb1-b198-3187e176b177avatar1630510677527.jpg"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Minh Pham",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "useremail@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  TextField(
                    // obscureText: true,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // labelText: 'Name',
                      hintText: "Enter your name",
                    ),
                    controller: TextEditingController(text: "Minh Phạm"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Birthday:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your birthday",
                    ),
                    controller: TextEditingController(text: "08/06/1999"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Phone:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your phone",
                    ),
                    controller: TextEditingController(text: "0977778899"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Country:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your country",
                    ),
                    controller: TextEditingController(text: "Viet Nam"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Level:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your level",
                    ),
                    controller: TextEditingController(text: "Intermediate"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: RoundedButtonSmallPadding(
                  text: "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
