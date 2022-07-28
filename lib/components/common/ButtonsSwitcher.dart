import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../../utils/constants.dart' as Constants;

/* Toogle buttons switcher */
class ButtonsSwitcher extends StatefulWidget {
  final Iterable<String> items;

  const ButtonsSwitcher({Key? key, required this.items}) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<ButtonsSwitcher> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 15.0, //extend the shadow
                offset: const Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ]),
        height: 50,
        child: ToggleButtons(
          constraints: BoxConstraints(
              minWidth: (MediaQuery.of(context).size.width - 32) /
                  widget.items.length),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          renderBorder: false,
          color: const Color(Constants.SECONDARY_COLOR),
          fillColor: const Color(Constants.PRIMARY_COLOR),
          selectedColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(Constants.SECONDARY_COLOR)),
          children: widget.items
              .mapIndexed((index, item) => Row(children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(item)),
                if (index == activeIndex)
                  const Icon(
                    Icons.check_circle,
                    size: 26,
                  )
              ]))
              .toList(),
          isSelected: widget.items
              .mapIndexed((index, item) => index == activeIndex)
              .toList(),
          onPressed: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ));
  }
}
