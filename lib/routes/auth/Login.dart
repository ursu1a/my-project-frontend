import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/components/inputs/InputTextField.dart';
import 'package:frontend/routes/job/JobList.dart';
import 'package:frontend/routes/job/JobListItem.dart';

/* Login with email form */
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Stack(children: [
          Container(
              margin: const EdgeInsets.only(top: 8),
              width: double.infinity,
              height: 0.6,
              color: Colors.black38),
          Container(
              alignment: Alignment.topCenter,
              child: Container(
                  color: Colors.white,
                  child: Text('  ${AppLocalizations.of(context)!.or}  ')))
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InputTextField(
              placeholder: AppLocalizations.of(context)!.createEmailAccount),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InputTextField(
                isPassword: true,
                placeholder: AppLocalizations.of(context)!.password)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    final items = List<JobListItem>.generate(
                        25,
                        (i) => JobListItem(
                            'Title $i',
                            'Company $i',
                            'Location $i',
                            5.0,
                            ['Test1', 'Test2', 'Test3'],
                            '\$3K/M'));
                    return JobList(items: items);
                  })),
              child: Text(AppLocalizations.of(context)!.continueEmail)),
        )
      ],
    ));
  }
}
