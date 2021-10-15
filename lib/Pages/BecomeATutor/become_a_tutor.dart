import 'package:flutter/material.dart';
import 'package:lettutor/Pages/ListTutor/card_tutor.dart';
import 'package:lettutor/customWidgets/rounded_input_field.dart';
import 'package:lettutor/models/tutor.dart';

class BecomeATutorPage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                  0.9,
              // padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
          ],
        ),
      ),
    );
  }
}
