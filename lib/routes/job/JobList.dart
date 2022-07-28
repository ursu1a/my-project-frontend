import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/routes/job/JobListItem.dart';
import 'package:frontend/components/common/ButtonsSwitcher.dart';
import 'package:frontend/components/common/BottomNavbar.dart';
import '../../utils/constants.dart' as Constants;

class JobList extends StatelessWidget {
  final List<JobListItem> items;

  const JobList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: Row(
                children: [
                  const Icon(Icons.content_paste_search_outlined,
                      color: Color(Constants.PRIMARY_COLOR), size: 35),
                  Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text(AppLocalizations.of(context)!.appTitle)),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                  ),
                )
              ],
              titleTextStyle: Theme.of(context).textTheme.caption),
              
          bottomNavigationBar: BottomNavbar(),
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 15, left: 16, right: 16),
                  child: ButtonsSwitcher(
                    items: [
                      AppLocalizations.of(context)!.listRecommended,
                      AppLocalizations.of(context)!.listApplied,
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          child: Container(
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.2),
                                      blurRadius: 10.0, // soften the shadow
                                      spreadRadius: 3.0, //extend the shadow
                                      offset: const Offset(
                                        5.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ]),
                              child: ListTile(
                                  leading: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {},
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      alignment: Alignment.center,
                                      child: const CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/logo.webp'),
                                      ),
                                    ),
                                  ),
                                  title: item.buildTitle(context),
                                  subtitle: item.buildSubtitle(context),
                                  horizontalTitleGap: 20,
                                  minVerticalPadding: 0,
                                  onTap: () => Navigator.pushNamed(
                                      context, Constants.JOB_DETAILS_PATH))));
                    }),
              ),
            ]),
          )),
    ]);
  }
}
