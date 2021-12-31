import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/user.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key key,
    this.user,
  }) : super(key: key);

  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _form = GlobalKey<FormState>();

  String _inputName;
  String _inputBirthday;
  String _inputPhone;
  String _inputCountry;
  String _inputLevel;

  void _pickUserDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        // _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).profile),
      ),
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
                              "https://api.app.lettutor.com/avatar/86248137-6f7d-4cf5-ad2e-34da42722b28avatar1628058042246.jpg"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            widget.user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            widget.user.email,
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
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context).name + ":",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      // obscureText: true,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // labelText: 'Name',
                        hintText: "Enter your name",
                      ),
                      controller: TextEditingController(text: widget.user.name),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).birthday + ":",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your birthday",
                      ),
                      controller:
                          TextEditingController(text: widget.user.birthday),
                      onTap: () {
                        _pickUserDate();
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).phone + ":",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your phone",
                      ),
                      controller:
                          TextEditingController(text: widget.user.phone),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).country + ":",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your country",
                      ),
                      controller:
                          TextEditingController(text: widget.user.country),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context).level + ":",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter your level",
                      ),
                      controller:
                          TextEditingController(text: widget.user.level),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: RoundedButtonSmallPadding(
                        text: AppLocalizations.of(context).save,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
