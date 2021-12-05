import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/customWidgets/language_picker_widget.dart';
import 'package:lettutor/screens/AccountManagement/setting_screen.dart';
import 'package:lettutor/screens/Chat/chat_screen.dart';
import 'package:lettutor/screens/Schedule/schedule_list_screen.dart';
import 'package:lettutor/screens/Tutor/search_tutor_list_screen.dart';
import 'package:lettutor/screens/Tutor/tutor_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // String lang = AppLocalizations.of(context).language;
    // print(lang);
    _pages = [
      {
        'page': TutorListScreen(),
        'title': 'Home',
      },
      {
        'page': ChatScreen(),
        'title': 'Message',
      },
      {
        'page': ScheduleListScreen(),
        'title': 'Upcomming',
      },
      {
        'page': SearchTutorListScreen(),
        'title': 'Tutors',
      },
      {
        'page': SettingScreen(),
        'title': 'Settings',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String textAppBar(String pageTitle) {
      if (pageTitle == "Home")
        return AppLocalizations.of(context).home;
      else if (pageTitle == "Message")
        return AppLocalizations.of(context).message;
      else if (pageTitle == "Upcomming")
        return AppLocalizations.of(context).upcomming;
      else if (pageTitle == "Tutors")
        return AppLocalizations.of(context).tutors;
      return AppLocalizations.of(context).settings;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          textAppBar(_pages[_selectedPageIndex]['title']),
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        actions: [
          LanguagePickerWidget(),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
      // drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: kPrimaryColor,
        unselectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: const Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: const Icon(Icons.message_rounded),
            label: AppLocalizations.of(context).message,
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: const Icon(Icons.upcoming),
            label: AppLocalizations.of(context).upcomming,
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: const Icon(Icons.people_alt),
            label: AppLocalizations.of(context).tutors,
          ),
          BottomNavigationBarItem(
            backgroundColor: kPrimaryColor,
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).settings,
          ),
        ],
      ),
    );
  }
}
