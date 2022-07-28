import 'package:flutter/material.dart';

/*
 * Styled statefull checkbox component
*/ 
class CheckboxComponent extends StatefulWidget {
  const CheckboxComponent({Key? key}): super(key: key);

  @override _CheckboxComponentState createState() => _CheckboxComponentState();
}

class _CheckboxComponentState extends State<CheckboxComponent> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return primaryColor;
    }

    return (
      Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked, 
        onChanged: (bool? value) {
          setState(() {
            isChecked=value!;
          });
        }
      )
    );
  }
}