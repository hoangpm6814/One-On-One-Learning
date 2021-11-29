import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';
import 'package:lettutor/models/schedule_provider.dart';
import 'package:lettutor/models/tutor_provider.dart';
import 'package:lettutor/screens/AccountManagement/setting_screen.dart';
import 'package:lettutor/screens/Chat/chat_screen.dart';
import 'package:lettutor/screens/Schedule/schedule_list_screen.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:lettutor/screens/Tutor/search_tutor_list_screen.dart';
import 'package:lettutor/screens/Tutor/tutor_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TutorProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ScheduleProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'One-on-one App',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: '/', // default is '/'
        routes: {
          '/': (ctx) => TabsScreen(),
          TutorListScreen.routeName: (ctx) => TutorListScreen(),
          // TutorDetailScreen.routeName: (ctx) => TutorDetailScreen(),
          ChatScreen.routeName: (ctx) => ChatScreen(),
          ScheduleListScreen.routeName: (ctx) => ScheduleListScreen(),
          SearchTutorListScreen.routeName: (ctx) => SearchTutorListScreen(),
          SettingScreen.routeName: (ctx) => SettingScreen(),
        },

        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => TutorListScreen(),
          );
        },
      ),
    );
  }
}



// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: 'One On One',
//     theme: ThemeData(
//       primaryColor: kPrimaryColor,
//       scaffoldBackgroundColor: Colors.white,
//     ),
//     home: TutorListScreen(),
//   );
// }
