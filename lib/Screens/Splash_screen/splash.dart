import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tinder/Screens/Welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage('assets/photo_1.jpg')),
          ),
        ),
      ),
    );
  }
}
