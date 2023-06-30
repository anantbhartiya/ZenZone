import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenzone/screens/signupscreen.dart';
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
    navigateToSignUpScreen();
  }

  void navigateToSignUpScreen() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              Image.asset('assets/splashscreen-1.png'),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                "Welcome",
                style: semiboldTextStyle.copyWith(fontSize: getProportionateScreenHeight(30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}