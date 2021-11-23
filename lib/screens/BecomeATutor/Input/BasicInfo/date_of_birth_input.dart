import 'package:flutter/material.dart';

class DateOfBirthInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        // _dateOfBirth = value;
      },
    );
  }
}
