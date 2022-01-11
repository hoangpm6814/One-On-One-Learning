import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/search.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/screens/Course/local_widgets/card_course.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchCourseListScreen extends StatefulWidget {
  static const routeName = '/search-tutor-list';

  @override
  State<SearchCourseListScreen> createState() => _SearchCourseListScreenState();
}

class _SearchCourseListScreenState extends State<SearchCourseListScreen> {
  String query = '';
  List<Course> courses;
  List<Course> allCourses;

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: AppLocalizations.of(context).search_course,
        onChanged: searchCourse,
      );

  void searchCourse(String query) {
    final searchCourses = allCourses.where((course) {
      final nameLower = course.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      query = query;
      courses = searchCourses;
    });
  }

  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<CourseProvider>(context).fetchCourses().then((_) {
        setState(() {
          _isLoading = false;
        });
        allCourses =
            Provider.of<CourseProvider>(context, listen: false).listCourse;
        print("allCourses length: " + allCourses.length.toString());
        courses = allCourses;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(AppLocalizations.of(context).course),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  buildSearch(),
                  const SizedBox(
                    height: 10,
                  ),
                  courses.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "No courses match...",
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
                              0.81,
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              return CardCourse(course: courses[index]);
                            },
                            itemCount: courses.length,
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
