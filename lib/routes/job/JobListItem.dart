import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:frontend/components/common/ChipComponent.dart';
import '../../utils/constants.dart' as Constants;

/*
  Job List item
 */
class JobListItem {
  final String title;
  final String company;
  final String location;
  final double rating;
  final List<String> requirements;
  final String salary;

  JobListItem(this.title, this.company, this.location, this.rating,
      this.requirements, this.salary);

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  company,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(location,
                      style: Theme.of(context).textTheme.subtitle1))
            ],
          )),
          Chip(
              visualDensity: const VisualDensity(vertical: -4),
              avatar: const Icon(
                Icons.star_outlined,
                size: 15,
                color: Color(Constants.PRIMARY_COLOR),
              ),
              label: Text(rating.toStringAsFixed(1)),
              labelPadding: const EdgeInsets.only(left: 0, right: 5),
              labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(Constants.PRIMARY_COLOR)),
              backgroundColor: const Color(Constants.PRIMARY_LIGHT_COLOR)),
        ]));
  }

  @override
  Widget buildSubtitle(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              child: Wrap(
                  spacing: 10,
                  runSpacing: 0.4,
                  children: requirements
                      .map((item) => ChipComponent(label: item, size: 'small'))
                      .toList())),
          Text(salary, style: Theme.of(context).textTheme.headline3)
        ]));
  }
}
