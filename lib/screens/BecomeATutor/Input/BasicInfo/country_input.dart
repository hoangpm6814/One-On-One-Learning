import 'package:flutter/material.dart';

class CountryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        // _country = value;
      },
    );
  }
}
