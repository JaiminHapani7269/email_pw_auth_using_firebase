import 'package:auth_demo/screen/home_screem.dart';
import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Colors.blue, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Colors.red, width: 2),
  ),
);

const HomeScreenTextStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
);
