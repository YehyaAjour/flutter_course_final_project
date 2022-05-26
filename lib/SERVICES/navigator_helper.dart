import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  NavigationHelper._();
  static NavigationHelper navigationHelper = NavigationHelper._();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  pushMethod(String pagename) {
    navigatorKey.currentState.pushNamed(pagename);
  }

  pushReplacmentMethod(String pagename) {
    navigatorKey.currentState.pushReplacementNamed(pagename);
  }


  popMethod(String pagename) {
    navigatorKey.currentState.pop(pagename);
  }
}
