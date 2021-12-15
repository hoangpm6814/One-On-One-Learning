import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lettutor/l10n/l10n.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:lettutor/providers/rating_provider.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/theme_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/screens/AccountManagement/setting_screen.dart';
import 'package:lettutor/screens/Chat/chat_screen.dart';
import 'package:lettutor/screens/Schedule/schedule_list_screen.dart';
import 'package:lettutor/screens/Tutor/search_tutor_list_screen.dart';
import 'package:lettutor/screens/Tutor/tutor_list_screen.dart';
import 'package:lettutor/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        ChangeNotifierProvider.value(
          value: RatingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LocaleProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final localeProvider = Provider.of<LocaleProvider>(context);
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'One-on-one App',
            // theme: ThemeData(
            //   primaryColor: kPrimaryColor,
            //   scaffoldBackgroundColor: Colors.white,
            // ),
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            locale: localeProvider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            initialRoute: '/', // default is '/'
            routes: {
              '/': (ctx) => WelcomeScreen(),
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
