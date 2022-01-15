import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/search.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/models/filter_chip.data.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/screens/Tutor/local_widgets/search_card_tutor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTutorListScreen extends StatefulWidget {
  static const routeName = '/search-tutor-list';

  @override
  State<SearchTutorListScreen> createState() => _SearchTutorListScreenState();
}

class _SearchTutorListScreenState extends State<SearchTutorListScreen> {
  var _isInit = true;
  var _isLoading = false;
  String query = '';
  List<Tutor> tutors;
  List<Tutor> allTutors;
  List<FilterChipData> filterChips = DUMMY_SPECIALTIES;
  int _page = 1;
  ScrollController _scrollController = new ScrollController();
  List<FilterChipData> filterValues = [];

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
                        filterValues = filterChips
                            .where((element) => element.isSelected == true)
                            .toList();
                        // // print(filterValues.length);
                        // tutors = allTutors
                        //     .where((element) => filterValues.every((item) =>
                        //         element.specialties
                        //             .toLowerCase()
                        //             .contains(item.label.toLowerCase())))
                        //     .toList(); // tutor that has specialties contains all filter value

                        final List<String> specialties = [];
                        for (int i = 0; i < filterValues.length; i++) {
                          print(filterValues[i].label.toLowerCase());
                          specialties.add(filterValues[i].label.toLowerCase());
                        }
                        print("specialties length: " +
                            specialties.length.toString());
                        Provider.of<TutorProvider>(context, listen: false)
                            .fetchSearchTutorsPage(specialties, _page = 1, true)
                            .then((value) {
                          print("go to then");
                          print("tutor: " + tutors.length.toString());
                          tutors =
                              Provider.of<TutorProvider>(context, listen: false)
                                  .listSearchTutor;
                          print("tutor: " + tutors.length.toString());
                          print("go to then 2");
                        });
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
        onChanged: searchTutor,
      );

  void searchTutor(String query) {
    final searchTutors = tutors.where((todo) {
      final nameLower = todo.name.toLowerCase();
      final nationLower = todo.country.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          nationLower.contains(searchLower);
    }).toList();

    setState(() {
      query = query;
      tutors = searchTutors;
    });
  }

  @override
  void initState() {
    super.initState();

    final List<String> specialties = [];
    for (int i = 0; i < filterValues.length; i++) {
      print(filterValues[i].label.toLowerCase());
      specialties.add(filterValues[i].label.toLowerCase());
    }

    var courseProvider = Provider.of<TutorProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        courseProvider.fetchSearchTutorsPage(specialties, ++_page);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("go to didChangeDependencies");
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final List<String> specialties = [];
      for (int i = 0; i < filterValues.length; i++) {
        print(filterValues[i].label.toLowerCase());
        specialties.add(filterValues[i].label.toLowerCase());
      }
      Provider.of<TutorProvider>(context, listen: false)
          .fetchSearchTutorsPage(specialties, 1, true)
          .then((_) {
        allTutors =
            Provider.of<TutorProvider>(context, listen: false).listSearchTutor;
        tutors = allTutors;
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    // allTutors = Provider.of<TutorProvider>(context).listTutor;
    // tutors = allTutors;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tutorProvider = Provider.of<TutorProvider>(context);
    final tutorLength = tutorProvider.listSearchTutor.length;
    print("tutorLength: " + tutorLength.toString());
    final totalRecords = tutorProvider.totalRecords;
    print("totalRecords: " + totalRecords.toString());
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildSearch(),
          buildFilterChips(),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : tutors.length == 0
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
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          ...tutors.map(
                            (tutor) => SearchCardTutor(tutor: tutor),
                          ),
                          if (tutorLength < totalRecords)
                            Center(child: CircularProgressIndicator()),
                        ],
                      ),
                      // child: ListView.builder(
                      //   itemBuilder: (ctx, index) {
                      //     return SearchCardTutor(tutor: tutors[index]);
                      //   },
                      //   itemCount: tutors.length,
                      // ),
                    ),
        ],
      ),
    );
  }
}
