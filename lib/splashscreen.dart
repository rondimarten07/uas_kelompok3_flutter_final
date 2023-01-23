import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas_kelompok3/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Login(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "images/LogoSTTB.png",
      text: "AKADEMIK",
      textType: TextType.ColorizeAnimationText,
      // ignore: prefer_const_constructors
      textStyle: TextStyle(
          fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: 'Righteous'),
      colors: const [
        Color.fromRGBO(40, 167, 69, 1),
        Color.fromRGBO(33, 150, 243, 1),
        Color.fromRGBO(156, 39, 176, 1),
        Color.fromRGBO(255, 235, 59, 1),
        Color.fromRGBO(244, 67, 54, 1),
      ],
      backgroundColor: Colors.white,
    );
  }
}
