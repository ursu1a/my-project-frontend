import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants.dart' as Constants;

/* Link component, requires title and url address to go */
class LinkComponent extends StatelessWidget {
  final String title;
  final String url;

  const LinkComponent({Key? key, required this.title, required this.url})
      : super(key: key);

  void doLaunchURL(String _url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(title,
          style: const TextStyle(
              decoration: TextDecoration.underline, color: Color(Constants.PRIMARY_COLOR), fontSize: 16, fontWeight: FontWeight.bold)),
      onTap: () {
        doLaunchURL(url);
      },
    );
  }
}
