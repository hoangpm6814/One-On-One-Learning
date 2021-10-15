import 'package:flutter/material.dart';
import 'package:lettutor/Pages/BecomeATutor/avatar_picker.dart';
import 'package:lettutor/Pages/BecomeATutor/choose_level_radio_button.dart';
import 'package:lettutor/Pages/BecomeATutor/part_divider.dart';

class InputField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputFieldState();
  }
}

class InputFieldState extends State<InputField> {
  String _name;
  String _email;
  String _country;
  String _dateOfBirth;
  String _interest;
  String _education;
  String _experience;
  String _job;
  String _language;
  String _introduction;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      // maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCountry() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Country'),
      // maxLength: 30,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Country is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _country = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildDateOfBirth() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Date of birth'),
      // keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Date of birth is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _dateOfBirth = value;
      },
    );
  }

  Widget _buildInterest() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your interests, hobbies'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Interest is required';
        }

        return null;
      },
      onSaved: (String value) {
        _interest = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  Widget _buildEducation() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your education, degrees'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Education is required';
        }

        return null;
      },
      onSaved: (String value) {
        _education = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  Widget _buildExperience() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your experience'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Experience is required';
        }

        return null;
      },
      onSaved: (String value) {
        _experience = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  Widget _buildJob() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your previous or current job'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Job is required';
        }

        return null;
      },
      onSaved: (String value) {
        _job = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  Widget _buildLanguage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your languages'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Language is required';
        }

        return null;
      },
      onSaved: (String value) {
        _language = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  Widget _buildTeaching() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Introduction'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Introduction is required';
        }

        return null;
      },
      onSaved: (String value) {
        _introduction = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Become A Tutor")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PartDivider(text: "Basic Information"),
                AvatarPicker(),
                _buildName(),
                _buildCountry(),
                _buildEmail(),
                _buildDateOfBirth(),
                SizedBox(height: 30),
                PartDivider(text: "CV"),
                _buildInterest(),
                _buildEducation(),
                _buildExperience(),
                _buildJob(),
                SizedBox(height: 30),
                PartDivider(text: "Language"),
                _buildLanguage(),
                SizedBox(height: 30),
                PartDivider(text: "Teaching"),
                _buildTeaching(),
                LevelRadio(),
                PartDivider(text: "Introduction Video"),
                ElevatedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_email);
                    print(_dateOfBirth);

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
