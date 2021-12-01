import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/light_rounded_button_small_padding.dart';
import 'package:lettutor/models/rating.dart';
import 'package:lettutor/models/rating_provider.dart';
import 'package:provider/provider.dart';

class AlertDialogRating extends StatefulWidget {
  final String tutorId;

  const AlertDialogRating({
    Key key,
    this.tutorId,
  }) : super(key: key);

  @override
  State<AlertDialogRating> createState() => _AlertDialogRatingState();
}

class _AlertDialogRatingState extends State<AlertDialogRating> {
  String comment = '';
  final _form = GlobalKey<FormState>();

  int selectedRating = 0;
  static const maxRating = 5;

  Widget _buildRatingStar(int index) {
    if (index < selectedRating) {
      return Icon(
        Icons.star,
        color: Colors.yellow,
        size: 35,
      );
    } else {
      return Icon(
        Icons.star_border_outlined,
        size: 35,
      );
    }
  }

  Widget _buildRatingRow() {
    final stars = List<Widget>.generate(maxRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            selectedRating = index + 1;
          });
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: stars,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Review this tutor:'),
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              _buildRatingRow(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "How do you think about the tutor?",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Write down your experience...",
                ),
                onSaved: (String value) {
                  comment = value;
                },
                keyboardType: TextInputType.multiline,
                // maxLength: 200,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              LightRoundedButtonSmallPadding(
                text: "Review tutor",
                press: () {
                  // send data
                  _form.currentState.save();
                  Provider.of<RatingProvider>(context, listen: false)
                      .createNewRating(
                    Rating(
                      id: '18',
                      studentId: '1',
                      tutorId: widget.tutorId,
                      date: DateTime.now(),
                      comment: comment,
                      star: selectedRating,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
