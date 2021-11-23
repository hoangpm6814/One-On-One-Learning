import 'package:flutter/material.dart';

class LanguageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your languages'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Language is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _language = value;
      },
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
