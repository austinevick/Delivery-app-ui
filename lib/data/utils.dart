import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

const bodyPadding = EdgeInsets.symmetric(horizontal: 16);
const animationDuration = Duration(milliseconds: 1000);

final borderSide = BorderSide(color: Colors.grey.shade300);
const numberTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
Future<T?> push<T>(Widget child) => Navigator.of(navigatorKey.currentContext!)
    .push(MaterialPageRoute(builder: (context) => child));

void pop() => Navigator.of(navigatorKey.currentContext!).pop();

Future<void> pushReplacement(Widget child) =>
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) => child));

Future<void> pushAndRemoveUntil(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);
void showSnackbar(String msg) =>
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
