import 'package:flutter/material.dart';
import 'package:Learn_English_Today/utils/constants/ui_const.dart';

/// Splash Widget
class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(UiConst.splashText),
      ),
    );
  }
}
