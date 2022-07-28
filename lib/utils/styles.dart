import 'dart:ui';

import 'package:flutter/material.dart';
import './constants.dart' as Constants;

//White background button style
final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
    elevation: 10,
    alignment: Alignment.centerLeft,
    shadowColor: Colors.black38,
    onPrimary: const Color(Constants.SECONDARY_COLOR),
    primary: Colors.white,
    minimumSize: const Size(double.infinity, 55),
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800));
