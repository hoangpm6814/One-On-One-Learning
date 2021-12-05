import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/search.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/filter_chip.data.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_provider.dart';
import 'package:lettutor/screens/Tutor/local_widgets/card_tutor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTutorListScreen extends StatefulWidget {
  static const routeName = '/search-tutor-list';

  @override
  State<SearchTutorListScreen> createState() => _SearchTutorListScreenState();
}

class _SearchTutorListScreenState extends State<SearchTutorListScreen> {
  String query = '';
  List<Tutor> tutors;
  List<Tutor> allTutors;
  List<FilterChipData> filterChips = DUMMY_SPECIALTIES;

  Widget buildFilterChips() => Container(
        height: (MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top + kToolbarHeight)) *
            0.05,
        margin: EdgeInsets.symmetric(
          vertical: 3,
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: filterChips
              .map(
                (filterChip) => Row(
                  children: [
                    FilterChip(
                      label: Text(filterChip.label),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: filterChip.color,
                      ),
                      backgroundColor: filterChip.color.withOpacity(0.1),
                      onSelected: (isSelected) => setState(() {
                        filterChips = filterChips.map((otherChip) {
                          return filterChip == otherChip
                              ? otherChip.copy(isSelected: isSelected)
                              : otherChip;
                        }).toList();
                        // print(filterChips
                        //     .where((element) => element.isSelected == true)
                        //     .toList()
                        //     .length);
                        final filterValues = filterChips
                            .where((element) => element.isSelected == true)
                            .toList();
                        // print(filterValues.length);
                        tutors = allTutors
                            .where((element) => filterValues.every((item) =>
                                element.specialties.contains(item.label)))
                            .toList(); // tutor that has specialties contains all filter value

                        // print("tutor: " + tutors.length.toString());
                      }),
                      selected: filterChip.isSelected,
                      checkmarkColor: filterChip.color,
                      selectedColor: filterChip.color.withOpacity(0.25),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              )
              .toList(),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: AppLocalizations.of(context).search_tutor,
        onChanged: searchTodo,
      );

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
          buildFilterChips(),
          tutors.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppLocalizations.of(context).no_tutor_match,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
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
