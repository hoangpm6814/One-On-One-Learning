import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/customWidgets/rounded_button_medium_padding.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/custom_border_noti.dart';
import 'package:lettutor/screens/BecomeATutor/local_widgets/part_divider.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_medium_padding.dart';
import 'package:video_player/video_player.dart';

class BecomeATutorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BecomeATutorScreenState();
  }
}

class BecomeATutorScreenState extends State<BecomeATutorScreen> {
  String _name;
  String _country;
  String _dateOfBirth;
  String _interest;
  String _education;
  String _experience;
  String _job;
  String _language;
  String _introduction;
  String _specialties;
  String _price;
  File imageFile;
  File videoFile;
  VideoPlayerController _videoPlayerController;
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'beginner';
  // Group Value for Radio Button. // default
  int id = 1;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    try {
      print("_name: " + _name);
      print("_country: " + _country);
      print("_dateOfBirth: " + _dateOfBirth);
      print("_interest: " + _interest);
      print("_education: " + _education);
      print("_experience: " + _experience);
      print("_job: " + _job);
      print("_language: " + _language);
      print("_introduction: " + _introduction);
      print("_specialties: " + _specialties);
      print("_price: " + _price);
      print("radioButtonItem: " + radioButtonItem);

      // // Log user in
      // await Provider.of<AuthProvider>(context, listen: false).login(
      //   email,
      //   password,
      // );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => TabsScreen(),
      //   ),
      // );
    } catch (error) {
      const errorMessage = 'Incorrect email or password.';
      _showErrorDialog(errorMessage);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Cancel'),
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      setState(() {
        imageFile = File(image.path);
        print("imageFile: " + image.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickVideo(ImageSource source) async {
    try {
      final video = await ImagePicker().pickVideo(source: source);
      if (video == null) {
        return;
      }

      // videoFile = File(video.path);
      setState(() {
        videoFile = File(video.path);
        print("videoFile: " + video.path);
      });
      _videoPlayerController = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController.play();
        });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Become A Tutor"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      Text(
                        "Set up your tutor profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomedNotification(
                  text:
                      "Your tutor profile is your chance to reach students on app. You can edit it later on your profile page.\n\nNew students can browse tutor profiles to find a tutor that matches their academic goals and personality. When a student returns they can search from the profile of tutors who are willing to give them a great experience.",
                ),
                PartDivider(text: "Basic Information"),
                // AvatarPicker(),
                imageFile != null
                    ? InkWell(
                        onTap: () => _showImageSourceActionSheet(context),
                        child: Container(
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: new Border.all(
                              color: Colors.red,
                              // color: kPrimaryColor,
                              width: 4.0,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.file(
                              imageFile,
                              width: 250,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () => _showImageSourceActionSheet(context),
                        child: Column(
                          children: [
                            Container(
                              // padding: EdgeInsets.all(3), // Border width
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                  color: Colors.red,
                                  // color: kPrimaryColor,
                                  width: 4.0,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/add_avatar_img.png",
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Click to choose your avatar',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                // // _buildName(),
                // NameInput(
                //   name: _name,
                // ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'What do people call you?',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Name is Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _name = value;
                  },
                ),
                // CountryInput(),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Country'),
                  maxLength: 30,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Country is Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _country = value;
                  },
                ),
                // DateOfBirthInput(),
                TextFormField(
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
                ),
                SizedBox(height: 30),
                PartDivider(text: "CV"),
                CustomedNotification(
                  text:
                      "To protect your privacy, please do not share any personal information such as email, phone number, skype,... in your profile.",
                ),
                // InterestInput(),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Your interests, hobbies'),
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
                ),
                // EducationInput(),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Your education, degrees'),
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
                ),
                // ExperienceInput(),
                TextFormField(
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
                  keyboardType: TextInputType.multiline,
                  maxLength: 200,
                  maxLines: 3,
                ),
                // JobInput(),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Your previous or current job'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Job is required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _job = value;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLength: 200,
                  maxLines: 3,
                ),
                SizedBox(height: 30),
                PartDivider(text: "Language"),
                // LanguageInput(),
                TextFormField(
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
                  keyboardType: TextInputType.multiline,
                  maxLength: 200,
                  maxLines: 3,
                ),
                SizedBox(height: 30),
                PartDivider(text: "Teaching"),
                CustomedNotification(
                  text:
                      "This is the first thing students see when seeking for tutors.",
                ),
                // TeachingInput(),
                TextFormField(
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
                  keyboardType: TextInputType.multiline,
                  maxLength: 200,
                  maxLines: 3,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Your specialties'),
                  maxLength: 30,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Specialties is Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _specialties = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  maxLength: 30,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Price is Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _price = value;
                  },
                ),
                // LevelRadio(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "I prefer working with student's level: " +
                            '$radioButtonItem',
                        // style: TextStyle(fontSize: 21),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'beginner';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Beginner',
                          // style: new TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'intermediate';
                              id = 2;
                            });
                          },
                        ),
                        Text(
                          'Intermediate',
                          // style: new TextStyle(
                          //   fontSize: 17.0,
                          // ),
                        ),
                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'advanced';
                              id = 3;
                            });
                          },
                        ),
                        Text(
                          'Advanced',
                          // style: new TextStyle(fontSize: 17.0),
                        ),
                      ],
                    ),
                  ],
                ),
                PartDivider(text: "Introduction Video"),
                CustomedNotification(
                  text:
                      "Some useful tips:\n1) Look straight at the camera and smile naturally.\n2) Find a quite place to make a video.\n3) Dress politely.\n4) Video should be between 1 and 3 minutes.\n5) Brand yourself and have fun.",
                ),
                LightRoundedButtonMediumPadding(
                  // color: Colors.white,
                  // textColor: kPrimaryColor,
                  text: "Choose video",
                  press: () {
                    pickVideo(ImageSource.gallery);
                  },
                ),
                SizedBox(height: 10),
                videoFile != null
                    ? Center(
                        child: Text(
                          videoFile.path,
                        ),
                      )
                    : Container(),
                // if (videoFile != null)
                //   _videoPlayerController.value.isInitialized
                //       ? AspectRatio(
                //           aspectRatio: _videoPlayerController.value.aspectRatio,
                //           child: VideoPlayer(_videoPlayerController),
                //         )
                //       : Container(),
                SizedBox(height: 30),
                RoundedButtonMediumPadding(
                  color: kPrimaryColor,
                  text: 'Press to become a tutor!',
                  press: () {
                    _submit();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImageSourceActionSheet(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Camera'),
              onPressed: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Gallery'),
              onPressed: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            )
          ],
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => Wrap(children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              pickImage(ImageSource.gallery);
            },
          ),
        ]),
      );
    }
  }
}
