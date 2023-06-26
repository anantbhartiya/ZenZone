import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenzone/screens/homescreen.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }


  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              Image.asset('assets/splashscreen-1.png'),
              SizedBox(height: getProportionateScreenHeight(50)),
              Text(
                "Welcome",
                style: regularTextStyle.copyWith(fontSize: getProportionateScreenHeight(30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}