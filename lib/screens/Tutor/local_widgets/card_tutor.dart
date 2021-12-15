import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/rating.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/screens/TutorDetail/tutor_detail_screen.dart';
import 'package:provider/provider.dart';

class CardTutor extends StatelessWidget {
  const CardTutor({
    Key key,
    @required this.tutor,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TutorDetailScreen(
              id: tutor.id,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        // margin: EdgeInsets.symmetric(
        //   vertical: 8,
        //   horizontal: 3,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Image.network('https://picsum.photos/250?image=9'),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(tutor.avatar),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    RatingStar(
                      rating: tutor.rating,
                    ),
                    // Container(
                    //   height: 30,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: <Widget>[
                    //       SpecialityButtonClickable(
                    //         text: "English for kids",
                    //         isChosen: true,
                    //       ),
                    //       SizedBox(width: 5),
                    //       SpecialityButtonClickable(
                    //         text: "English for Business",
                    //       ),
                    //       SizedBox(width: 5),
                    //       SpecialityButtonClickable(
                    //         text: "Conversational",
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Wrap(
                      children: [
                        for (var item in tutor.specialties)
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: SpecialityButtonClickable(
                              text: item,
                              isChosen: true,
                            ),
                          ),
                      ],
                    ),
                  ],
                )),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: <Widget>[
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 150,
                    child: Text(
                      tutor.description,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

// child: ListTile(
      //   leading: CircleAvatar(
      //     radius: 30,
      //     child: Padding(
      //       padding: EdgeInsets.all(6),
      //       child: FittedBox(
      //         child: Text('${tutor.name}'),
      //       ),
      //     ),
      //   ),
      //   title: Text(
      //     tutor.name,
      //     // style: Theme.of(context).textTheme.title,
      //   ),
      //   subtitle: Text(
      //     tutor.rating.toString(),
      //   ),
      //   trailing: MediaQuery.of(context).size.width > 460
      //     ? IconButton(
      //         icon: Icon(Icons.favorite),
      //         color: Theme.of(context).errorColor,
      //         onPressed: () => {},
      //       )
      //     : IconButton(
      //         icon: Icon(Icons.delete),
      //         color: Theme.of(context).errorColor,
      //         onPressed: () => {},
      //       ),
      // ),
