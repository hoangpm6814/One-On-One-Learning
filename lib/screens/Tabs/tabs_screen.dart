import 'package:flutter/material.dart';
import 'package:lettutor/screens/AccountManagement/setting_screen.dart';
import 'package:lettutor/screens/Chat/chat_screen.dart';
import 'package:lettutor/screens/Schedule/schedule_list_screen.dart';
import 'package:lettutor/screens/Tutor/search_tutor_list_screen.dart';
import 'package:lettutor/screens/Tutor/tutor_list_screen.dart';

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
        'title': 'UpComing',
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
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      // drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.message_rounded),
            label: "Message",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.upcoming),
            label: "Upcoming",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.people_alt),
            label: "Tutors",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
