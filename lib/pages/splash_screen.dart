import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:list_view_onclik/colors/colorStyle.dart';
import 'package:list_view_onclik/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Column(
          children: <Widget>[
            Image.asset(
              'asset/images/bg_splash_screen.png',
              width: 300,
              height: 300,
            ),
          ],
        ),
        nextScreen: const HomePage(),
        splashIconSize: 300,
        splashTransition: SplashTransition.slideTransition,
        animationDuration: const Duration(seconds: 1),
        backgroundColor: ColorStyle().kPrimaryColorBrigh);
  }
}
