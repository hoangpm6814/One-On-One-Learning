import 'package:flutter/material.dart';

class InterestInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your interests, hobbies'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Interest is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _interest = value;
      },
      // autofocus: false,
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
