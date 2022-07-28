import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:frontend/components/common/LinkComponent.dart';
import 'package:frontend/components/common/ChipComponent.dart';
import '../../utils/constants.dart' as Constants;

/* Job details page */
class JobDetails extends StatelessWidget {
  //Details header
  Widget printHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Chip(
              padding: EdgeInsets.all(8),
              avatar: Icon(
                Icons.star_outlined,
                size: 20,
                color: Color(Constants.PRIMARY_COLOR),
              ),
              label: Text('5.0'),
              labelPadding: EdgeInsets.only(left: 2, right: 5),
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(Constants.PRIMARY_COLOR)),
              backgroundColor: Color(Constants.PRIMARY_LIGHT_COLOR)),
        ),
        const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child:
                LinkComponent(title: 'Lauren J.Bormann', url: 'http://test')),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text('Wordpress Developer',
              style: Theme.of(context).textTheme.headline1),
        ),
        const Text('\$ 3K/Monthly',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(Constants.MUTED_TEXT_COLOR))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.place,
                size: 16,
                color: Color(Constants.SECONDARY_COLOR),
              ),
            ),
            const Expanded(
                child: Text('New York, NY',
                    style: TextStyle(
                        color: Color(Constants.MUTED_TEXT_COLOR),
                        fontWeight: FontWeight.bold))),
            FloatingActionButton(
                elevation: 0,
                mini: true,
                backgroundColor: const Color(Constants.PRIMARY_COLOR),
                onPressed: () {},
                child: const Icon(Icons.file_upload_outlined, size: 26))
          ],
        )
      ]),
    );
  }

  //Tab Overview
  Widget printOverview(BuildContext context) {
    return (Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(spacing: 5, runSpacing: 0.4, children: [
                ChipComponent(label: 'Wordpress'),
                ChipComponent(label: 'HTML'),
                ChipComponent(label: 'JS')
              ]),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Text(lorem(paragraphs: 5, words: 180),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(Constants.TEXT_COLOR)))),
          ],
        ),
      ],
    ));
  }

  //Tab Responsibilities
  Widget printResponsibilities(BuildContext context) {
    final List<String> items = List.generate(
        5,
        (index) =>
            'Responsibility Responsibility Responsibility Responsibility number ${index}');

    return BulletedList(listItems: items);
  }

  //Tab Location
  Widget printLocations(BuildContext context) {
    final List<Widget> locations = List.generate(
      4,
      (index) => Container(
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Address: Address name'),
              const Text('Phone: +45688745454121'),
              const Text('Email: company@email.com')
            ],
          ),
        ),
      ),
    );

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('${AppLocalizations.of(context)!.postCompanyLocations}:',
          style: Theme.of(context).textTheme.headline3),
      BulletedList(
          listItems: locations,
          bullet: Icon(
            Icons.minimize_outlined,
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/details_bg.jpg"), fit: BoxFit.cover),
      )),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz_outlined,
                ),
              )
            ],
          ),
          body: Container(
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: printHeader(context)),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
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
                    child: DefaultTabController(
                      length: 3,
                      initialIndex: 0,
                      child: Column(children: [
                        TabBar(
                          labelColor: const Color(Constants.PRIMARY_COLOR),
                          unselectedLabelColor:
                              const Color(Constants.SECONDARY_COLOR),
                          indicatorColor: Colors.transparent,
                          labelStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          tabs: [
                            Tab(
                                text:
                                    AppLocalizations.of(context)!.postOverview),
                            Tab(
                                text: AppLocalizations.of(context)!
                                    .postResponsibilities),
                            Tab(
                                text:
                                    AppLocalizations.of(context)!.postLocation)
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 5, left: 20, right: 20),
                            child: TabBarView(children: [                              
                              SingleChildScrollView(child: printOverview(context)),
                              SingleChildScrollView(child: printResponsibilities(context)),
                              SingleChildScrollView(child: printLocations(context))
                            ]),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .postApply))),
                                  ],
                                ),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                      .postShareInfoText,
                                  style: Theme.of(context).textTheme.subtitle1)
                            ]))
                      ]),
                    )),
              )
            ]),
          )),
    ]);
  }
}
