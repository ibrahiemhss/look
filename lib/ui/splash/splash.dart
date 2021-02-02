import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:look/constants/assets.dart';
import 'package:look/constants/colors/colors.dart';
import 'package:look/constants/dimens.dart';

import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
            width: Dimens.logoSize,
            child: Image.asset(
              Assets.appLogo,
              color: AppColors.green[500],
            )),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // if (preferences.getBool(Preferences.isLoggedIn) ?? false) {
    Navigator.of(context).pushNamed(Routes.main);
    //  } else {
    //   Navigator.of(context).pushNamed(Routes.login);
    //   }
  }
}
