// Colors
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

TextEditingController operatoreController = new TextEditingController();
TextEditingController ordineController = new TextEditingController();
TextEditingController matricolaController = new TextEditingController();

class InfoSection{
  final String name;
  final List<String> singleInfo;

  InfoSection({this.name, this.singleInfo});
}

const kMainColorLight = Color(0xFFE7EEFB);
const kMainColorDark = Color(0xFF323E57);

const kSidebarBackgroundColorLight = Color(0xFFF1F4FB);
const kSidebarBackgroundColorDark = Color(0xFF42506B);

const kCardPopupBackgroundColorLight = Color(0xFFF1F4FB);
const kCardPopupBackgroundColorDark = Color(0xFF42506B);

const kPrimaryLabelColorLight = Color(0xFF242629);
const kPrimaryLabelColorDark = Color(0xFFD5DBE3);

const kPrimaryIconColorLight = Color(0xFF17294D);
const kPrimaryIconColorDark = Color(0xFFD5DBE3);

const kSecondaryLabelColorLight = Color(0xFF797F8A);
const kSecondaryLabelColorDark = Color(0xFFBEC6D4);

const kShadowColorLight = Color.fromRGBO(72, 76, 82, 0.16);
const kShadowColorDark = Color.fromRGBO(31, 33, 36, 0.16);

const kCourseElementIconColorLight = Color(0xFF17294D);
const kCourseElementIconColorDark = Color(0xFF0B1221);

// Text Styles
var kLargeHomeTitleStyleLight = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: kMainColorDark,
  decoration: TextDecoration.none,
);

var kLargeTitleStyleLight = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kLargeTitleStyleDark = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kTitle1StyleLight = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kTitle1StyleDark = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kCardTitleStyleLight = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 26.0,
  decoration: TextDecoration.none,
);
var kCardTitleStyleDark = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 26.0,
  decoration: TextDecoration.none,
);
var kTitle2StyleLight = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kTitle2StyleDark = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kHeadlineLabelStyleLight = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kHeadlineLabelStyleDark = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kSubtitleStyleLight = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kSubtitleStyleDark = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kBodyLabelStyleLight = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  decoration: TextDecoration.none,
);
var kBodyLabelStyleDark = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  decoration: TextDecoration.none,
);
var kCalloutLabelStyleLight = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kCalloutLabelStyleDark = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kSecondaryCalloutLabelStyleLight = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kSecondaryCalloutLabelStyleDark = TextStyle(
  fontSize: 16.0,
  color: kSecondaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kSearchPlaceholderStyleLight = TextStyle(
  fontSize: 20,
  color: kSecondaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kSearchPlaceholderStyleDark = TextStyle(
  fontSize: 20,
  color: kSecondaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kFieldTextStyleLight = TextStyle(
  fontSize: 20,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.bold,
);

var kFieldTextStyleDark = TextStyle(
  fontSize: 40,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
  fontWeight: FontWeight.bold,
);
var kSearchTextStyleLight = TextStyle(
  fontSize: 20.0,
  color: kPrimaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kSearchTextStyleDark = TextStyle(
  fontSize: 20.0,
  color: kPrimaryLabelColorDark,
  decoration: TextDecoration.none,
);
var kCardSubtitleStyleLight = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  decoration: TextDecoration.none,
);
var kCardSubtitleStyleDark = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  decoration: TextDecoration.none,
);
var kCaptionLabelStyleLight = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColorLight,
  decoration: TextDecoration.none,
);
var kCaptionLabelStyleDark = TextStyle(
  fontSize: 12.0,
  color: kSecondaryLabelColorDark,
  decoration: TextDecoration.none,
);

Route CreateRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

ShowToastError(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

ShowToastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.teal[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

ShowToastDone(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
