import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
// import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatefulWidget {
  @override
  _AvatarPickerState createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  /// Variables
  File imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Container(
      child: imageFile == null
          ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryLightColor,
                      fixedSize: Size(250, 250),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: kPrimaryColor,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(0)),
                    ),
                    child: Text(
                      'Load your avatar image',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                      'Click to choose your avatar',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            ),
    );
  }

  /// Get from gallery
  // _getFromGallery() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  // /// Get from Camera
  // _getFromCamera() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
}
