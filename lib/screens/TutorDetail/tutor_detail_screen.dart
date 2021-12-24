import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/customWidgets/rating.dart';
import 'package:lettutor/models/rating.dart';
import 'package:lettutor/providers/rating_provider.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/screens/Chat/chat_detail_screen.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/alert_dialog_rating_tutor.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/alert_dialog_report_tutor.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/card_rating.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/pick_schedule_bottom.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/tutor_description.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/rounded_button_medium_padding.dart';
import 'package:lettutor/screens/TutorDetail/local_widgets/video/network_video_player.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:video_player/video_player.dart';

class TutorDetailScreen extends StatefulWidget {
  static const routeName = '/tutor-detail';
  const TutorDetailScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  Tutor tutor;
  List<Rating> ratings;

  VideoPlayerController videoPlayerController;

  @override
  void didChangeDependencies() {
    tutor = Provider.of<TutorProvider>(context).getById(widget.id);
    ratings = Provider.of<RatingProvider>(context).getByTutorId(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).tutor_detail),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        // maxRadius: 70,
                        backgroundImage: NetworkImage(tutor.avatar),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tutor.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Teacher",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          tutor.nation,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      RatingStar(
                        rating: tutor.rating,
                      ),
                      IconButton(
                        icon: Icon(tutor.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                        color: Theme.of(context).errorColor,
                        onPressed: () => {
                          Provider.of<TutorProvider>(context, listen: false)
                              .toggleIsFavourite(tutor.id),
                        },
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: double.infinity,
                child: RoundedButtonMediumPadding(
                  text: AppLocalizations.of(context).booking,
                  press: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return PickScheduleBottom(tutorId: tutor.id);
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.message,
                          color: kPrimaryColor,
                        ),
                        Text(
                          AppLocalizations.of(context).message,
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatDetailScreen(),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.info,
                          color: kPrimaryColor,
                        ),
                        Text(
                          AppLocalizations.of(context).report,
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogReport();
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: kPrimaryColor,
                        ),
                        Text(
                          AppLocalizations.of(context).reviews,
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogRating(
                            tutorId: tutor.id,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              TutorDescription(tutor: tutor),
              SizedBox(height: 10),
              const NetworkPlayerWidget(
                url:
                    "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).rating_and_comment +
                    " (${ratings.length})",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              ratings.length > 0
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).padding.top +
                                  MediaQuery.of(context).padding.bottom +
                                  kToolbarHeight)) *
                          0.5,
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return CardRating(
                            rating: ratings[index],
                          );
                        },
                        itemCount: ratings.length,
                      ),
                    )
                  : Container(
                      child: Text(
                        AppLocalizations.of(context).no_rating_tutor,
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
