import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/constants.dart' as Constants;

class InputTextField extends StatefulWidget {
  final String placeholder;
  final bool? isPassword;

  const InputTextField({Key? key, required this.placeholder, this.isPassword})
      : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

// See here about validation:
// https://codewithandrea.com/articles/flutter-text-field-form-validation/
class _InputTextFieldState extends State<InputTextField> {
  bool hasError = false;
  String errorText = 'Fill this field';

  @override
  Widget build(BuildContext context) {
    //Border style initial
    const OutlineInputBorder inputBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(Constants.MUTED_TEXT_COLOR)),
    );

    // Border style active
    const OutlineInputBorder inputBorderActiveStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.black87),
    );

    // Border style error
    const OutlineInputBorder inputBorderErrorStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: Colors.deepOrange));

    // Error text style
    const TextStyle errorTextStyle = TextStyle(
        color: Colors.deepOrange, fontSize: 12, fontWeight: FontWeight.w500);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            obscureText: widget.isPassword ?? false,
            style: const TextStyle(color: Colors.black87, fontSize: 15),
            decoration: InputDecoration(
                filled: true,
                fillColor: hasError ? Colors.deepOrange[50] : Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                enabledBorder: inputBorderStyle,
                focusedErrorBorder: inputBorderActiveStyle,
                focusedBorder: inputBorderActiveStyle,
                errorBorder: inputBorderErrorStyle,
                errorText: hasError ? '' : null,
                errorStyle: const TextStyle(height: 0),
                hintStyle: const TextStyle(color: Colors.black26),
                hintText: widget.placeholder)),
        if (hasError)
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('This field is required', style: errorTextStyle),
          )
      ],
    );
  }
}
