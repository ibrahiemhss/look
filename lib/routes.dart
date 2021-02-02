import 'package:flutter/material.dart';
import 'package:look/ui/intro/intro_slider_screen.dart';
import 'package:look/ui/main/main_screen.dart';
import 'package:look/ui/route/route_screen.dart';

import 'ui/splash/splash.dart';

class Routes {
  final data;

  Routes._({this.data});

  //static variables
  static const String intro = '/intro';
  static const String routeScreen = '/routeScreen';
  static const String splash = '/splash';
  static const String main = '/main';

  static routes({data}) => <String, WidgetBuilder>{
        intro: (BuildContext context) => IntroScreen(),
        routeScreen: (BuildContext context) => ChangeRouteScreen(),
        splash: (BuildContext context) => SplashScreen(),
        main: (BuildContext context) => MainPagesScreen(),
      };
}
