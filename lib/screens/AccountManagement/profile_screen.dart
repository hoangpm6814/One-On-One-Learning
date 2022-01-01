import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_small_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  // ProfileScreen({
  //   Key key,
  //   this.user,
  // }) : super(key: key);

  // final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _isLoading = false;

  final _form = GlobalKey<FormState>();

  String _inputName;
  DateTime _inputBirthday;
  String _inputPhone;
  String _inputCountry;
  String _inputLevel;

  User user;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    user = Provider.of<UserProvider>(context).userInfo;
    _inputName = user.name;
    _inputPhone = user.phone;
    _inputCountry = user.country;
    _inputLevel = user.level;
    _inputBirthday = DateFormat("yyyy-MM-dd").parse(user.birthday);
    super.didChangeDependencies();
  }

  void _pickUserDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2022),
    ).then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        _inputBirthday = date;
      });
    });
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();
    if (_inputBirthday == null) {
      _inputBirthday = DateTime.now();
    }

    String strDateTime = DateFormat("yyyy-MM-dd").format(_inputBirthday);
    setState(() {
      _isLoading = true;
    });
    print(_inputName);
    print(_inputBirthday);
    print(_inputPhone);
    print(_inputCountry);
    print(_inputLevel);
    Provider.of<UserProvider>(context, listen: false)
        .updateUserInfo(
      User(
        name: _inputName,
        phone: _inputPhone,
        country: _inputCountry,
        birthday: strDateTime,
        level: _inputLevel,
      ),
    )
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).userInfo;
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
                            user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            user.email,
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
                      controller: TextEditingController(text: _inputName),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputName = value;
                      },
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
                        hintText: "Choose your birthday",
                      ),
                      controller: TextEditingController(
                          text:
                              DateFormat("yyyy-MM-dd").format(_inputBirthday)),
                      onTap: () {
                        _pickUserDate();
                      },
                      readOnly: true,
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
                      controller: TextEditingController(text: _inputPhone),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputPhone = value;
                      },
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
                      controller: TextEditingController(text: _inputCountry),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputCountry = value;
                      },
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
                      controller: TextEditingController(text: _inputLevel),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _inputLevel = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            width: double.infinity,
                            child: RoundedButtonSmallPadding(
                              text: AppLocalizations.of(context).save,
                              press: () {
                                _saveForm();
                              },
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
