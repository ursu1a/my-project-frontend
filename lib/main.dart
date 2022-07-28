import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/routes/home/SplashScreen.dart';
import 'package:frontend/routes/auth/AuthSelect.dart';
import 'package:frontend/routes/job/JobDetails.dart';
import 'package:frontend/routes/job/JobList.dart';
import './utils/constants.dart' as Constants;
import 'routes/job/JobList.dart';
import 'package:frontend/routes/home/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      initialRoute: Constants.HOME_PATH,
      routes: {
        Constants.HOME_PATH: ((context) => SplashScreen()),
        Constants.AUTH_PATH: ((context) => AuthSelect()),
        Constants.JOB_LIST_PATH: (context) => const JobList(
              items: []),
        Constants.JOB_DETAILS_PATH: (context) => JobDetails()
      },
      theme: ThemeData(
        primaryColor: const Color(Constants.PRIMARY_COLOR),
        secondaryHeaderColor: const Color(Constants.SECONDARY_COLOR),
        backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 65,
          titleSpacing: 16,
          iconTheme:
              IconThemeData(color: Color(Constants.SECONDARY_COLOR), size: 30),
        ),
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 32,
              color: Color(Constants.SECONDARY_COLOR),
              fontWeight: FontWeight.w800,
            ),
            headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Color(Constants.SECONDARY_COLOR)),
            headline2: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(Constants.SECONDARY_COLOR)),
            headline3: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: Color(Constants.SECONDARY_COLOR)),
            headline4: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Color(Constants.PRIMARY_COLOR)),
            caption: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(Constants.SECONDARY_COLOR)),
            bodyText2: TextStyle(fontSize: 14),
            subtitle1: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(Constants.MUTED_TEXT_COLOR))),
        // Horizontal sliding transitions for routes
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        //Button style
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                shape: RoundedRectangleBorder(                    
                    borderRadius: BorderRadius.circular(12)),
                primary: const Color(Constants.PRIMARY_COLOR), // background color
                textStyle: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700))),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
