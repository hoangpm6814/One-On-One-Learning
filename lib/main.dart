import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lettutor/data/data.dart';
import 'package:lettutor/l10n/l10n.dart';
import 'package:lettutor/providers/auth_provider.dart';
import 'package:lettutor/providers/google_signin_provider.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:lettutor/providers/rating_provider.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/student_schedule_provider.dart';
import 'package:lettutor/providers/theme_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/providers/tutor_schedule_provider.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/screens/AccountManagement/setting_screen.dart';
import 'package:lettutor/screens/Chat/chat_screen.dart';
import 'package:lettutor/screens/Schedule/schedule_list_screen.dart';
import 'package:lettutor/screens/Splash/splash_screen.dart';
import 'package:lettutor/screens/Tabs/tabs_screen.dart';
import 'package:lettutor/screens/Tutor/search_tutor_list_screen.dart';
import 'package:lettutor/screens/Tutor/tutor_list_screen.dart';
import 'package:lettutor/screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Note: haven't initializeApp Firebase
  // https://www.youtube.com/watch?v=1k-gITZA9CI
  // final String name = 'foo';
  // final FirebaseOptions options = const FirebaseOptions(
  //   googleAppID: '1:825785584678:android:7354333a0c1cc0a9716ae7',
  //   gcmSenderID: '825785584678',

  //   // apiKey: 'AIzaSyBq6mcufFXfyqr79uELCiqM_O_1-G72PVU',
  // );

  // await FirebaseApp.configure(name: name, options: options);
  runApp(const MyApp());
}

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
          value: AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, TutorProvider>(
          create: (ctx) => TutorProvider('', DUMMY_TUTORS), // init
          // create: (ctx) => TutorProvider('', []),
          update: (ctx, auth, previousTutor) => TutorProvider(
              auth.token, previousTutor == null ? [] : previousTutor.listTutor),
        ),
        ChangeNotifierProvider.value(
          value: GoogleSignInProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, UserProvider>(
          create: (ctx) => UserProvider(''), // init
          update: (ctx, auth, previousUser) => UserProvider(auth.token),
        ),
        ChangeNotifierProxyProvider<AuthProvider, TutorScheduleProvider>(
          create: (ctx) => TutorScheduleProvider(''), // init
          update: (ctx, auth, previousUser) =>
              TutorScheduleProvider(auth.token),
        ),
        ChangeNotifierProxyProvider<AuthProvider, StudentScheduleProvider>(
          create: (ctx) => StudentScheduleProvider(''), // init
          update: (ctx, auth, previousUser) =>
              StudentScheduleProvider(auth.token),
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
          return Consumer<AuthProvider>(
              builder: (ctx, auth, _) => MaterialApp(
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
                      '/': (ctx) => auth.isAuth
                          ? TabsScreen()
                          : FutureBuilder(
                              future: auth.tryAutoLogin(),
                              builder: (context, authResultSnapshot) =>
                                  authResultSnapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? SplashScreen()
                                      : WelcomeScreen(),
                            ),
                      // "/": (ctx) => ForgotPasswordScreen(),
                      TutorListScreen.routeName: (ctx) => TutorListScreen(),
                      // TutorDetailScreen.routeName: (ctx) => TutorDetailScreen(),
                      ChatScreen.routeName: (ctx) => ChatScreen(),
                      ScheduleListScreen.routeName: (ctx) =>
                          ScheduleListScreen(),
                      SearchTutorListScreen.routeName: (ctx) =>
                          SearchTutorListScreen(),
                      SettingScreen.routeName: (ctx) => SettingScreen(),
                    },

                    onUnknownRoute: (settings) {
                      return MaterialPageRoute(
                        builder: (ctx) => TutorListScreen(),
                      );
                    },
                  ));
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
