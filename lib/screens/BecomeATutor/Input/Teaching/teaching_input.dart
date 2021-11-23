import 'package:flutter/material.dart';

class TeachingInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Introduction'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Introduction is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _introduction = value;
      },
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
