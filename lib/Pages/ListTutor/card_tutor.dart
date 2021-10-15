import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';

class CardTutor extends StatelessWidget {
  const CardTutor({
    Key key,
    @required this.tutor,
  }) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
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
                    backgroundImage: NetworkImage(
                        "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg"),
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
                    "Darlyn Grace Sausa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text("DRating"),
                  Text("English"),
                ],
              )),
              SizedBox(
                width: 15,
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    color: Theme.of(context).errorColor,
                    onPressed: () => {},
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
                    'I am a nice english teacher who helps you import English. I am a nice english teacher who helps you import English. I am a nice english teacher who helps you import English. I am a nice english teacher who helps you import English. I am a nice english teacher who helps you import English. I am a nice english teacher who helps you import English.',
                  ),
                ),
              ),
            ],
          )
        ]),
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
