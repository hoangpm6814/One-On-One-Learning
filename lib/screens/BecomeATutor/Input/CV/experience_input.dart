import 'package:flutter/material.dart';

class ExperienceInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your experience'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Experience is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _experience = value;
      },
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
