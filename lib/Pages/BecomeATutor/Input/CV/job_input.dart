import 'package:flutter/material.dart';

class JobInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Your previous or current job'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Job is required';
        }
        return null;
      },
      onSaved: (String value) {
        // _job = value;
      },
      keyboardType: TextInputType.multiline,
      maxLength: 200,
      maxLines: 3,
    );
  }
}
