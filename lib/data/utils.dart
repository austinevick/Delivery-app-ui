import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

const bodyPadding = EdgeInsets.symmetric(horizontal: 16);
const animationDuration = Duration(milliseconds: 800);

final borderSide = BorderSide(color: Colors.grey.shade300);
const numberTextStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
Future<T?> push<T>(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    }));

void pop() => Navigator.of(navigatorKey.currentContext!).pop();

Future<void> pushReplacement(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ));

Future<void> pushAndRemoveUntil(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);
void showSnackbar(String msg) =>
    ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(msg)));
