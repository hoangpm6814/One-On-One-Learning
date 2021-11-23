import 'package:flutter/material.dart';

class EducationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your education, degrees'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Education is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _education = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
