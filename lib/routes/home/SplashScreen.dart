import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/routes/auth/AuthSelect.dart';
import 'package:frontend/routes/job/JobList.dart';
import '../job/JobListItem.dart';
import '../../utils/constants.dart' as Constants;

/* App splash screen */
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final items = List<JobListItem>.generate(
        25,
        (i) => JobListItem('Title $i', 'Company $i', 'Location $i', 5.0,
            ['Test1', 'Test2', 'Test3'], '\$3K/M'));

    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AuthSelect())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(Constants.PRIMARY_COLOR),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.content_paste_search_outlined,
                  color: Colors.white, size: 50),
            ),
            Text(Constants.APP_NAME,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w800)),
          ]),
        ));
  }
}
