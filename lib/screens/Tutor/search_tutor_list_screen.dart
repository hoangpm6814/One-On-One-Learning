import 'package:flutter/material.dart';
import 'package:lettutor/customWidgets/search.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_provider.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:lettutor/customWidgets/speciality_button_clickable.dart';
import 'package:provider/provider.dart';

class SearchTutorListScreen extends StatefulWidget {
  static const routeName = '/search-tutor-list';

  @override
  State<SearchTutorListScreen> createState() => _SearchTutorListScreenState();
}

class _SearchTutorListScreenState extends State<SearchTutorListScreen> {
  String query = '';
  List<Tutor> tutors;
  List<Tutor> allTutors;

  Widget buildSearch() => SearchWidget(
      text: query, hintText: 'Search for tutor...', onChanged: searchTodo);

  void searchTodo(String query) {
    final searchTutors = allTutors.where((todo) {
      final nameLower = todo.name.toLowerCase();
      final descriptionLower = todo.description.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          descriptionLower.contains(searchLower);
    }).toList();

    setState(() {
      query = query;
      tutors = searchTutors;
    });
  }

  @override
  void didChangeDependencies() {
    allTutors = Provider.of<TutorProvider>(context).listTutor;
    tutors = allTutors;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildSearch(),
          Container(
            height: (MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).padding.top + kToolbarHeight)) *
                0.05,
            // padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            margin: EdgeInsets.symmetric(
              vertical: 3,
            ),
            // color: k2PrimaryColor,
            child: Scaffold(
              body: Container(
                // width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    SpecialityButtonClickable(
                      text: "All",
                      isChosen: true,
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "English for kids",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "English for Business",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "Conversational",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "STARTERS",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "MOVERS",
                    ),
                    SizedBox(width: 5),
                    SpecialityButtonClickable(
                      text: "FLYERS",
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
          tutors.isEmpty
              ? Container()
              : Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.67,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return CardTutor(tutor: tutors[index]);
                    },
                    itemCount: tutors.length,
                  ),
                ),
        ],
      ),
    );
  }
}
