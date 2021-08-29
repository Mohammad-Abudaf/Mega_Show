import 'package:flutter/material.dart';

Route createRoute(Widget pageTwo, {
  double dx = 0.0,
  double dy = 1.0,
  var motion = Curves.ease,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  pageTwo,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(dx, dy);
      const end = Offset.zero;
      var curve = motion;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}