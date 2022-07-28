import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import './Login.dart';
import '../../utils/styles.dart' as Styles;
import '../../utils/constants.dart' as Constants;

/* Authorization page, 
select option to login */
class AuthSelect extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(children: [
            const Icon(Icons.content_paste_search_outlined,
                color: Color(Constants.PRIMARY_COLOR), size: 35),
            Container(
                margin: const EdgeInsets.only(left: 4),
                child: Text(AppLocalizations.of(context)!.appTitle,
                    style: const TextStyle(
                        color: Color(Constants.SECONDARY_COLOR),
                        fontSize: 20,
                        fontWeight: FontWeight.w800))),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 33),
          child: Row(
            children: [
              Text(AppLocalizations.of(context)!.welcomeBack,
                  style: Theme.of(context).textTheme.headlineLarge),
            ],
          ),
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: ElevatedButton.icon(
                icon: SvgPicture.asset('images/facebook.svg',
                    width: 24, height: 24),
                style: Styles.loginButtonStyle,
                onPressed: () {},
                label: Center(
                    child:
                        Text(AppLocalizations.of(context)!.continueFacebook))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: ElevatedButton.icon(
                icon: SvgPicture.asset('images/linkedin.svg',
                    width: 24, height: 24),
                style: Styles.loginButtonStyle,
                onPressed: () {},
                label: Center(
                    child:
                        Text(AppLocalizations.of(context)!.continueLinkedIn))),
          ),
          //form email login
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Login(),
          )
        ])
      ]),
    )));
  }
}
